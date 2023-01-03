while read url
do
  ((c++))
  LOCK_FILE="checkurls$c.lock"
  urlstatus=$(/usr/bin/curl -H 'Cache-Control: no-cache' -o /dev/null --silent --head --write-out '%{http_code}' "$url" )

  if [ "$urlstatus" = "200" ]
   then
    #echo "$DATENOW OK $urlstatus connection->$url" >> $LOG_FILE
    [ -e $LOCK_FILE ] && /bin/rm -f -- $LOCK_FILE > /dev/null && /bin/mail -s "NOTIFICATION URL OK: $url" $EMAIL <<< 'The URL is back online'
else
    echo "$DATENOW FAIL $urlstatus connection->$url" >> $LOG_FILE
    if [ -e $LOCK_FILE ]
     then
        #no action - awaiting URL to be fixed
        :
    else
        /bin/mail -s "NOTIFICATION URL DOWN: $url" $EMAIL <<< 'Failed to reach or URL problem'
        /bin/touch $LOCK_FILE
    fi
  fi
done < $1

# REMOVE LOG FILE IF LARGER THAN 100MB
# alow up to 2000 lines average
maxsize=120000
size=$(/usr/bin/du -k "$LOG_FILE" | /bin/cut -f 1)
if [ $size -ge $maxsize ]; then
     /bin/rm -f -- $LOG_FILE > /dev/null
     echo "$DATENOW LOG file [$LOG_FILE] has been recreated" > $LOG_FILE
else
     #do nothing
     :
fi
