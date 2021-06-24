gau $1 > urls.txt;cat urls.txt | grep "?" | unfurl --unique format %s://%d%p > base.txt; cat base.txt | parallel -j 4 grep {} -m5 urls.txt | qsreplace FUZZ | anew gauurls
gospider -s https://$1 -d 16 -a -c 250 | grep -oP "http(s)?://((?i)(([a-zA-Z0-9]{1}|[_a-zA-Z0-9]{1}[_a-zA-Z0-9-]{0,61}[a-zA-Z0-9]{1})[.]{1})+)?domain.com.*" | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | qsreplace FUZZ | anew gospiderurls;
python3 /root/ParamSpider/paramspider.py --domain $1 -o paramspiderurls;
waybackurls $1 | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | qsreplace FUZZ | anew waybackurl
cat gauurls gospiderurls output/paramspiderurls waybackurl | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | anew allurls;
cat gauurls gospiderurls output/paramspiderurls waybackurl | grep "=" | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | anew parameterurls;
rm -rf urls.txt base.txt gauurls gospiderurls output/ waybackurl;
cat parameterurls | Gxss | dalfox pipe
