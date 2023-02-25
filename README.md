## This program should probably be run by no one, ever.

## amass_runner.sh
- requires amass installed and in your path
- backs up previous data to found/old_amass_results/
- read domains from in targets.txt and enumerates subdomains for each line
- subdomains found are written out to the found/ directory in a series of named files.
## myamass
- used by amass_runner to run a simple active enum
- I should probably put this in amass_runner.sh

## gau_runner.sh
- grabs all files found from amass in the found/folder
- sorts them into a single list in current_check/current_list.txt
- backs up current_list if it already exists to current_check/previous_lists/
- runs gau on each domain in current_list.txt
- writes the output to a series of named text files in gau_links/
- each line in current_list.txt is deleted after gau finishes running
## gau_oneliners.sh
- scrubs for interesting endpoints
## Use
- place target domains in target.txt
- run amass_runner.sh
- run gau_runner.sh
- run gau_oneliners.sh
## Output
- Everything ends up in the sensitive folder for manual testing

