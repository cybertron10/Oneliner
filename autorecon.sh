echo "Automated Scan Started... Enumerating Subdomains" | notify
/root/MoneyScope/MoneyScope.sh -a
cat all_bbscope.txt | grep -v "github.com\|github.net\|shofify.com\|google.com"| anew scope
axiom-scan scope -m findomain -o find.txt
axiom-scan scope -m assetfinder -o ass.txt
axiom-scan scope -m subfinder -o subs.txt
cat find.txt ass.txt subs.txt | anew subdomains
rm ass.txt subs.txt find.txt
echo "Bruteforcing with DNScewl" | notify
axiom-scan subdomains -m dnscewl -o dnscewl.txt
axiom-scan dnscewl.txt -m dnsx -o dnssubs
rm dnscewl.txt
echo "Checking Live Subdomains with Htppx" | notify
axiom-scan dnssubs -m httpx -o newhttpxsubs
cat newhttpxsubs | anew oldhttpxsubs > newsubdomains
mv newhttpxsubs oldhttpxsubs
echo "New Subdomains Found" | notify
#cat newsubdomains | notify
echo "Starting Aquatone Scan"
#axiom-scan newsubdomains -m aquatone -o aqua
#cat aqua/aquatone_urls* | tee -a aquaurls
echo "Nuclei Scan Started" | notify
axiom-scan newsubdomains -m nuclei -t /home/op/nuclei-templates/cves/ -o nucleicve.txt
#axiom-scan newsubdomains -m nuclei -t /home/op/nuclei-templates/exposed-panels/ -o exposedpanels.txt
#axiom-scan newsubdomains -m nuclei -t /home/op/nuclei-templates/exposures/ -o exposures.txt
#axiom-scan newsubdomains -m nuclei -t /home/op/nuclei-templates/takeovers/ -o takeovers.txt
#axiom-scan newsubdomains -m nuclei -t /home/op/nuclei-templates/vulnerabilities/ -o vulnerabilities.txt
echo "Scan Completed" | notify
