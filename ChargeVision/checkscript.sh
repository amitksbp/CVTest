#WEBPAGE="http://www.chargevision3.com/"
#STDOUTFILE=".tempCurlStdOut"

WEBPAGE1="http://www.chargevision3.com/"
> $STDOUTFILE
HTTPCODE1=$(curl --max-time 5 --silent --write-out %{response_code} --output "$STDOUTFILE" "$WEBPAGE1")

#CONTENT=$(<$STDOUTFILE)
#HTTPLOC=$(curl --location --output "$STDOUTFILE" "$WEBPAGE") 
#echo "HTTP LOC: "${#HTTPLOC}


echo "HTTP CODE for CV3 : "$HTTPCODE1
if test $HTTPCODE1 -eq 200; then
    echo "HTTP STATUS CODE for CV3 $HTTPCODE -> Chargevision3 website is up" # stdout
else
    >&2 echo "HTTP STATUS CODE  $HTTPCODE -> Has something gone wrong?" #stderr
fi
#echo "CONTENT LENGTH: "${#CONTENT}" chars"


WEBPAGE2="http://www.chargevision5.com/"
STDOUTFILE=".tempCurlStdOut"
> $STDOUTFILE
HTTPCODE2=$(curl --max-time 5 --silent --write-out %{response_code} --output "$STDOUTFILE" "$WEBPAGE2")
echo "HTTP CODE for CV5: "$HTTPCODE2
if test $HTTPCODE2 -eq 200 || test $HTTPCODE2 -eq 301 ; then
    echo "HTTP STATUS CODE for CV5 $HTTPCODE -> Chargevision5 website is up" # stdout
else
    >&2 echo "HTTP STATUS CODE $HTTPCODE -> Has something gone wrong?" #stderr
fi
