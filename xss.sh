for domain in $(cat rootdomains); do
findomain -t $domain -o
subfinder -d $domain -o $domain.subfinder.txt
assetfinder -subs-only $domain | tee -a $domain.assetfinder.txt
done
cat *.txt | anew > domains
rm *.txt
cat domains | httpx -t 1000 -o domain
rm domains
echo "Subdomain Enumeration Completed" | toslack
jaeles scan -c 1000 -v -s /root/mysignature/crlf.yaml -U domain -o crlfoutput
cat crlfoutput | toslack
jaeles scan -c 1000 -v -s /root/mysignature/x-forwarded-host.yaml -U domain -o cachepoison
cat cachepoison | toslack
echo "Jaeles Scan Completed" | toslack
for subdomain in $(cat domain);do
gospider -s $subdomain -t 15 -d 16 -a -c 250 | grep "$subdomain" | grep -oP "http(s)?://((?i)(([a-zA-Z0-9]{1}|[_a-zA-Z0-9]{1}[_a-zA-Z0-9-]{0,61}[a-zA-Z0-9]{1})[.]{1})+)?.*" | gf xss | uro | anew gourls.txt
echo $subdomain | waybackurls | gf xss | uro | anew waybackxssurls.txt;
echo $subdomain | gau | gf xss | uro | anew gauurls.txt;
cat gourls.txt waybackxssurls.txt gauurls.txt | uro | anew xssurls.txt
jaeles scan -c 1000 -v -s /root/mysignature/xss.yaml -U xssurls.txt -o output
rm xssurls.txt
rm waybackxssurls.txt
rm gauurls.txt
rm gourls.txt
done
