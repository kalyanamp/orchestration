#! /bin/sh
#
#       {{ ansible_managed }}
#
#	Starts Logstash as a daemon
#
#       http://cookbook.logstash.net/recipes/using-init/logstash.sh
#
# chkconfig: 2345 20 80
# description: Starts Logstash as a daemon
# pidfile: /var/run/logstash.pid

### BEGIN INIT INFO
# Provides: logstash
# Required-Start: $local_fs $remote_fs
# Required-Stop: $local_fs $remote_fs
# Default-Start: 2 3 4 5
# Default-Stop: S 0 1 6
# Short-Description: Logstash
# Description: Starts Logstash as a daemon.
# Modified originally from https://gist.github.com/2228905#file_logstash.sh

### END INIT INFO

# Amount of memory for Java
JAVAMEM={{ logstash_memory }}

# Location of logstash files
LOCATION={{ logstash_bin_dir }}

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
DESC="Logstash Daemon"
NAME=java
DAEMON=`which java`
CONFIG_DIR={{ logstash_conf_dir }}/logstash.conf
LOGFILE={{ logstash_log_dir }}/logstash.log
PATTERNSPATH={{ logstash_patterns_dir }}
JARNAME=logstash.jar
ARGS="-Xmx$JAVAMEM -Xms$JAVAMEM -jar ${JARNAME} agent --config ${CONFIG_DIR} --log ${LOGFILE} --grok-patterns-path ${PATTERNSPATH} -v"
# ARGS="-jar ${JARNAME} agent --config ${CONFIG_DIR} --log ${LOGFILE} --grok-patterns-path ${PATTERNSPATH}"
SCRIPTNAME=/etc/init.d/logstash
PIDFILE=/var/run/logstash.pid
base=logstash

# Exit if the package is not installed
if [ ! -x "$DAEMON" ]; then
{
  echo "Couldn't find $DAEMON"
  exit 99
}
fi

. /etc/init.d/functions

#
# Function that starts the daemon/service
#
do_start()
{
  cd $LOCATION && \
  ($DAEMON $ARGS &) \
  && success || failure
}

set_pidfile()
{
  ps auxww | grep 'logstash.*\.jar' | grep java | awk '{print $2}' > $PIDFILE
}

#
# Function that stops the daemon/service
#
do_stop()
{
  pid=`cat $PIDFILE`
                       if checkpid $pid 2>&1; then
                           # TERM first, then KILL if not dead
                           kill -TERM $pid >/dev/null 2>&1
                           usleep 100000
                           if checkpid $pid && sleep 1 &&
                              checkpid $pid && sleep $delay &&
                              checkpid $pid ; then
                                kill -KILL $pid >/dev/null 2>&1
                                usleep 100000
                           fi
                        fi
                        checkpid $pid
                        RC=$?
                        [ "$RC" -eq 0 ] && failure $"$base shutdown" || success $"$base shutdown"

}

case "$1" in
  start)
    echo -n "Starting $DESC: "
    do_start
    touch /var/lock/subsys/$JARNAME
    set_pidfile
    ;;
  stop)
    echo -n "Stopping $DESC: "
    do_stop
    rm /var/lock/subsys/$JARNAME
    rm $PIDFILE
    ;;
  restart|reload)
    echo -n "Restarting $DESC: "
    do_stop
    do_start
    touch /var/lock/subsys/$JARNAME
    set_pidfile
    ;;
  status)
    status -p $PIDFILE
    ;;
  *)
    echo "Usage: $SCRIPTNAME {start|stop|status|restart}" >&2
    exit 3
    ;;
esac

echo
exit 0
