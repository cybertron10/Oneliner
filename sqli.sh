gau $1 | httpx -status-code -threads 500 | grep 200 | grep "=" | awk '{print $1}'| grep -v ".jpg\|.jpeg\|.gif\|.css\|.tif\|.tiff\|.png|.ttf\|.woff\|.woff2\|.ico\|.pdf\|.woff2\|.svg\|.js" | qsreplace payload | anew | tee -a gauurls.txt;
gospider -s https://telekom.de -d 16 -a -w -c 50 | grep -oP '(http|https)://[^/"].*' | cut -d "]" -f1 | grep -v ".jpg\|.jpeg\|.gif\|.css\|.tif\|.tiff\|.png|.ttf\|.woff\|.
woff2\|.ico\|.pdf\|.woff2\|.svg\|.js" | qsreplace payload | anew | tee -a gospiderurls.txt;
cat gauurls.txt gospiderurls.txt | sort -u | allurls.txt;
