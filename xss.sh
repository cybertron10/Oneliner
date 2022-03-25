gospider -S domain -d 16 -a -c 250 | grep -oP "http(s)?://((?i)(([a-zA-Z0-9]{1}|[_a-zA-Z0-9]{1}[_a-zA-Z0-9-]{0,61}[a-zA-Z0-9]{1})[.]{1})+)?gr8people.com.*" | gf xss | uro > xssurls.txt
wingman -l xssurls.txt --progress
rm xssurls.txt
cat domain | waybackurls | gf xss | uro > waybackxssurls.txt;
wingman -l waybackxssurls.txt --progress
rm waybackxssurls.txt
cat domain | gau | gf xss | uro > gauurls.txt;
wingman -l gauurls.txt --progress
rm gauurls.txt
wingman -l domain --crawl --progress
