gau $1 | httpx -silent -timeout 2 -threads 500 | grep "=" | grep -v ".jpg\|.jpeg\|.gif\|.css\|.tif\|.tiff\|.png|.ttf\|.woff\|.woff2\|.ico\|.pdf\|.woff2\|.svg\|.js" | qsreplace | anew | tee -a gauurls.txt;
gospider -s https://$1 -d 10 -t 20 -a -w --blacklist ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|woff2|svg|js)" | grep -oP "(http[s]?:\/\/)?((-)?[\w+\.]){1,}$1.*" | grep "=" | qsreplace payload | anew | sort -u | urlprobe -c 500 -t 01 | grep 200 | awk '{print $5}' | tee -a gospiderurls.txt
cat gauurls.txt gospiderurls.txt | sort -u | allurls.txt;
jaeles scan -c 1000 -v -s ../../jaeles-signatures/fuzz/sqli/sql-error.yaml -U allurls.txt -o SqliResults/
