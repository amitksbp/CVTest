website= "https://cv3chargevisiondev.com"
code=$(curl --head --location --max-time 5--silent --write-out '%{response_code}' $website --output /dev/null)
echo $code
