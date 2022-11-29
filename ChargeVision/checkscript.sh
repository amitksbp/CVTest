WEBPAGE="https://www.google.com/"
STDOUTFILE=".tempCurlStdOut"
> $STDOUTFILE
HTTPCODE=$(curl  --max-time 5 --silent --write-out %{response_code} --output "$STDOUTFILE" "$WEBPAGE")
CONTENT=$(<$STDOUTFILE)
echo "HTTP CODE: "$HTTPCODE
echo "CONTENT LENGTH: "${#CONTENT}" chars"
