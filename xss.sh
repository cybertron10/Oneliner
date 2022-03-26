for subdomain in $(cat domain);do
gospider -s $subdomain -d 16 -a -c 250 | grep "$subdomain" | grep -oP "http(s)?://((?i)(([a-zA-Z0-9]{1}|[_a-zA-Z0-9]{1}[_a-zA-Z0-9-]{0,61}[a-zA-Z0-9]{1})[.]{1})+)?.*" | gf xss | uro | anew gourls.txt
echo $subdomain | waybackurls | gf xss | uro | anew waybackxssurls.txt;
echo $subdomain | gau | gf xss | uro | anew gauurls.txt;
cat gourls.txt waybackxssurls.txt gauurls.txt | uro | anew xssurls.txt
wingman -l xssurls.txt --progress -json | notify
wingman -u $subdomain --crawl --progress --c-threads 50 -json | anew notify
rm xssurls.txt
rm waybackxssurls.txt
rm gauurls.txt
rm gourls.txt
done
