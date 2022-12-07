#WEBPAGE="http://www.chargevision3.com/"
WEBPAGE="http://www.chargevision3.com/"
STDOUTFILE=".tempCurlStdOut"
> $STDOUTFILE
HTTPCODE=$(curl --max-time 5 --silent --write-out %{response_code} --output "$STDOUTFILE" "$WEBPAGE")
CONTENT=$(<$STDOUTFILE)
HTTPLOC=$(curl --location --output "$STDOUTFILE" "$WEBPAGE") 
echo "HTTP LOC: "${#HTTPLOC}
echo "HTTP CODE: "$HTTPCODE
if test $HTTPCODE -eq 200; then
    echo "HTTP STATUS CODE $HTTPCODE -> OK" # stdout
else
    >&2 echo "HTTP STATUS CODE $HTTPCODE -> Has something gone wrong?" #stderr
fi
echo "CONTENT LENGTH: "${#CONTENT}" chars"
