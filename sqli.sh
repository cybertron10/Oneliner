gau $1 | httpx -silent -timeout 2 -threads 500 | anew | tee -a $1urls.txt;
cat $1urls.txt | gf sqli | tee -a $1sqliurls.txt;
jaeles scan -c 1000 -v -s ../../jaeles-signatures/fuzz/sqli/sql-error.yaml -U $1sqliurls.txt -o $1SqliResults/
