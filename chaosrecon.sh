#!/bin/bash
cronitor ping 5UoIcY --run
. ~/.bash_profile
. ~/.profile
cd /root/Chaos-Recon
input="/root/companyName.txt"
while IFS= read -r line
do
  curl -s https://chaos-data.projectdiscovery.io/"$line".zip -o "$line"/"$line".zip --create-dirs
find "$line"/ -iname "*.txt" | egrep '.*'
if [[ $? -eq 0 ]]; then
        echo "There are some txt found. Renaming..."
    for file in "$line"/*.txt
do
  mv "$file" "${file/.txt/.txt_old}"
done
else
                echo "There isn't any txt found."
fi
unzip "$line"/"$line".zip -d "$line"/
echo "Unzipped"
find "$line"/ -name '*.txt' -exec grep -Fxvf {}_old {} \;  > "$line"/differences.diff
find "$line"/ -name '*.txt' -exec sh -c 'sort -u $1 $1_old > $1_old' sh {} "$line"  \;
echo "Merged new files with old ones"
echo "deleting new files after merge"
rm "$line"/*.txt
rm "$line"/*.zip
done < "$input"

find . -name '*.diff' -exec cat {} \; | sort -u | httpx > /root/difference_domains

nuclei -c 1000 -v -l /root/difference_domains -t /root/nuclei-templates/ -o /root/NucleiResults.txt

jaeles scan -c 1000 -v -s /root/jaeles-signatures/ -U /root/difference_domains -o /root/JaelesResults/

nuclei -update-templates

cronitor ping 5UoIcY --complete
