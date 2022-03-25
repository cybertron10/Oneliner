gospider -S domain -d 16 -a -c 250 | grep -oP "http(s)?://((?i)(([a-zA-Z0-9]{1}|[_a-zA-Z0-9]{1}[_a-zA-Z0-9-]{0,61}[a-zA-Z0-9]{1})[.]{1})+)?gr8people.com.*" | gf xss | uro > gourls.txt
cat domain | waybackurls | gf xss | uro > waybackxssurls.txt;
cat domain | gau | gf xss | uro > gauurls.txt;
cat gourls.txt waybackxssurls.txt gauurls.txt | uro > xssurls.txt
wingman -l xssurls.txt --progress
wingman -l domain --crawl --progress
rm xssurls.txt
rm waybackxssurls.txt
rm gauurls.txt
rm gourls.txt
