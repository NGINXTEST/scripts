nginx      cut.sh

#!/bin/bash
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)
LOGS_PATH="/usr/local/nginx/logs/" 
PID_PATH="/usr/local/nginx/logs/nginx.pid"            
mv $LOGS_PATH/access.log $LOGS_PATH/access_$YESTERDAY.log
mv $LOGS_PATH/error.log $LOGS_PATH/error_$YESTERDAY.log
cd $LOGS_PATH
kill -USR1 `cat $PID_PATH`
find . -mtime +7 -name "*20[1-9][1-9]*" | xargs rm -f

00 00 * * * sh /usr/local/nginx/logs/cut.sh > /dev/null 2>&1

chmod 777 /usr/local/nginx/logs/cut.sh
