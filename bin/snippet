#!/bin/bash
# Snippet
# Author: Chafic Najjar <chafic.najjar@gmail.com>

output_directory="$HOME/Desktop/output"

# create output directory only if it doesn't exist
if [ ! -d "$output_directory" ]; then
    mkdir ~/Desktop/output
fi

# go to specified directory (argument passed when program was executed)
cd "$1"

# find the durations of all mp4 files and store in file "durations"
find . -name "*.mp4" |\
    xargs -I{} avprob 2>&1 |\
    grep "Duration" |\
    cut -d ' ' -f 4 |\
    sed s/,// |\
    awk '{ split($1, A, ":"); split(A[3], B, "."); print 3600*A[1] + 60*A[2] + B[1] }' >> durations 

# store the durations in an array
i=0
array=()
while read p; do
    array+=("$p")
    i=$((i+1))
done < durations 
 
find . -name "*.mp4" > file_names

# trim the videos
i=0
while read p; do
    q=$(echo "$p" | rev | cut -d'/' -f1 | rev)
    avconv -ss $((${array[$i]}-9)) -i "$p" -t 10 -vcodec copy -acodec copy ~/Desktop/output/"$q"; 
    i=$((i+1))
done < file_names 

# remove temporary files
rm "durations"
rm "file_names"

