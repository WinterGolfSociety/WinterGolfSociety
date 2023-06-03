#!/bin/bash
#
#
#
vline=""
NOW=$(date)
scriptfilename=$(basename $0)
#notify-send "Running $scriptfilename"

# create new atq.log file
# sorted by AT job number
echo "$scriptfilename: creating sorted list of jobs"
atq | sort -k1n | sed 's/bryan /bryan\n/g' | sed 's/\t/ /g' | sed 's/  / 0/g' >/home/bryan/scripts/logs/atq.log

# open the 2 files used
input4="/home/bryan/scripts/logs/log.log"
input3="/home/bryan/scripts/logs/atq.log"
lcount=0

# loop through file of AT job numbers
echo "$scriptfilename: reading atq.log list of at jobs"
while read line3 <&3; do

	echo "$scriptfilename: reading sorted list of jobs"

	# find time job will run
	vjobtimecheck=$(echo $line3 | cut -d " " -f 5)
	# get date as 2nd level check
	vjobdatecheck=$(echo $line3 | cut -d " " -f 2)

	# loop through log file and find corresponding time entry
	while read line4 <&4; do

		#echo "$scriptfilename: reading line of log.log"
		vjobtime=$(echo $line4 | cut -d " " -f 11 | sed 's/at://')
		vjobtimesuffix=":00"
		vjobtime=$vjobtime$vjobtimesuffix
		# get date as 2nd level check of day
		# vjobdate=$(echo $line4 | sed -e 's/\([^0-9]\)\([0-9]\)\([^0-9]\)/\10\2\3/'  | cut -d " " -f 2)
		vjobdate=$(echo $line4 | cut -d " " -f 12)

		# if the time is found ...
		if [ $vjobtimecheck = $vjobtime ] && [ $vjobdatecheck = $vjobdate ]; then

			# increment count and only print 3rd one
			lcount=$((lcount + 1))
			fullline=$(echo $line4 | cut -d "-" -f 2-10)

			# ignore first 2 finds then process the 3rd
			# this limits output to single entry
			if [ $lcount = 3 ]; then

				echo "$scriptfilename: found correct entry, composing line of information"
				echo "line3--$line3--"
				# changed from 4 to 6
				#line3=$(echo $line3 | cut -c 6- | sed 's/ a bryan//')
				
				
				
				
				
				# changed from 6 to 5
				#line3=$(echo $line3 | cut -c 5- | sed 's/ a bryan//')
				
				
				
				
				# changed from 5 to 3
				line3=$(echo $line3 | cut -c 3- | sed 's/ a bryan//')
				
				
				
				
				
				# add entry to create a list for output
				echo "line3==$line3--"
				outputline=$outputline"\n"$line3", "$fullline
				lcount=0

			fi

		fi

	done 4<$input4
	
	echo "4--$outputline"

done 3<$input3

echo "3--$outputline"

# cope with no entries found
if [ "--$outputline--" = "----" ]; then

	echo "$scriptfilename: no jobs found"
	outputline="No jobs outstanding"

fi

# sort output by date
#outputline=$(echo -e "$outputline" | sort -k 3)
# change sort parameters
outputline=$(echo -e "$outputline" | sort -k2M -k3n)

echo $outputline

# display window and info
#voutput=$(/usr/bin/zenity --info --title "$NOW - tee times booking"  --width=900 --text '<span foreground=\"blue\" font=\"26\">\n$outputline</span>')
#voutput=$(/usr/bin/zenity --info --title "$NOW - tee times booking"  --width=900 --text '<span foreground=\"blue\" font=\"26\">\n$outputline</span>')
#voutput=$(/usr/bin/zenity --info --title "$NOW - tee times booking"  --text '<span font=\"26\">'$outputline)
voutput=$(/usr/bin/zenity --info --title "$NOW - outstanding jobs" --width=920 --text "<big><big>$outputline</big></big>")

# get rid of temp atq.log
echo "$scriptfilename: deleting temporary atq.log file"
rm /home/bryan/scripts/logs/atq.log
