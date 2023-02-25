x=1
for i in $(cat sensitive/jsfiles.txt)
do
x=$((x+1))
python3 SecretFinder.py -i $i -o cli >> sensitive/secrets.txt
done

