for subdomain in $(cat domain);do
gospider -s $subdomain -t 15 -d 16 -a -c 250 | grep $subdomain | grep -oP "http(s)?://((?i)(([a-zA-Z0-9]{1}|[_a-zA-Z0-9]{1}[_a-zA-Z0-9-]{0,61}[a-zA-Z0-9]{1})[.]{1})+)?.*" | uro | anew gourls.txt
echo $subdomain | waybackurls | uro | anew waybackxssurls.txt;
echo $subdomain | gau | uro | anew gauurls.txt;
cat gourls.txt waybackxssurls.txt gauurls.txt | uro | anew xssurls.txt
jaeles scan -c 1000 -v -s /home/bugbuntu/Mysignature/xss.yaml -U xssurls.txt -o xssoutput
#rm xssurls.txt
#rm waybackxssurls.txt
#rm gauurls.txt
#rm gourls.txt
done
