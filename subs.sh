for domain in $(cat rootdomains); do
findomain -t $domain -o
subfinder -d $domain -o $domain.subfinder.txt
assetfinder -subs-only $domain | tee -a $domain.assetfinder.txt
done
cat *.txt | sort -u | anew alldomains | tee -a newdomains
rm *.txt
cat newdomains | httpx -t 1000 -o domain
