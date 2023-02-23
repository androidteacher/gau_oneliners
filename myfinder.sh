for i in $(cat targets.txt); do docker run projectdiscovery/subfinder:latest -d $i | tee -a found/$i.finder.txt; done
