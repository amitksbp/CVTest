website= "https://www.cv3chargevision.com"
code=$(curl --head --location --max-time 5--silent --write-out '%{response_code}' $website --output /dev/null)
echo $code
