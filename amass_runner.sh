now=`date +"%Y-%m-%d-at-%H:%M"`
cat found/* > found/old_amass_results/${now}-results.txt
rm found/*
for i in $(cat targets.txt); do ./myamass $i; done
