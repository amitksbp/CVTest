webpages= "http://chargevision3.com/ http://chargevision5.com/"

#webpage2= "http://chargevision5.com/"

for webpage in $webpages

do
     > $STDOUTFILE
     HTTPCODE=$(curl --max-time 5 --silent --write-out %{response_code} --output "$STDOUTFILE" "$webpages")
    
     
     
    echo "HTTPCODE1:" $HTTPCODE
    echo "HTTPCODE2:" $HTTPCODE
    
done

