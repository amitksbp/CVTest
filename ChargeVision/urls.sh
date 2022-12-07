webpage1= "http://chargevision3.com/"
webpage2= "http://chargevision5.com/"

for ((webpage1; webpage2))

do
     > $STDOUTFILE
     HTTPCODE1=$(curl --max-time 5 --silent --write-out %{response_code} --output "$STDOUTFILE" "$WEBPAGE1")
     HTTPCODE2=$(curl --max-time 5 --silent --write-out %{response_code} --output "$STDOUTFILE" "$WEBPAGE2")
     
     
    echo "HTTPCODE1:" $HTTPCODE1
    echo "HTTPCODE2:" $HTTPCODE2
    
done

