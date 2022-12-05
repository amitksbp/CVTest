WEBPAGE="http://admin.chargevision.com/"
#WEBPAGE="http://www.{chargevision3, chargevision5}.com/"
STDOUTFILE=".tempCurlStdOut"
> $STDOUTFILE
HTTPCODE=$(curl --max-time 5 --silent --write-out %{response_code} --output "$STDOUTFILE" "$WEBPAGE")
CONTENT=$(<$STDOUTFILE)
HTTPLOC=$(curl --location --output "$STDOUTFILE" "$WEBPAGE") 
echo "HTTP LOC: "${#HTTPLOC}
echo "HTTP CODE: "$HTTPCODE
echo "CONTENT LENGTH: "${#CONTENT}" chars"
