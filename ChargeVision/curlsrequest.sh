HTTPCODE=$(curl --max-time 5 --silent --write-out %{response_code} "http://www.chargevision3.com/" )
echo "HTTPCODE:z" $HTTPCODE
if $HTTPCODE -eq 200 then
echo "success"
fi
