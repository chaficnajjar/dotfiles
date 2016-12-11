#!/bin/bash
# Look for duplicates in terms of file content and display relevant information
# Author: Chafic Najjar

# current working directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# tree directory
directory=$1

# go to specified directory
cd $directory

# Basic idea:
# 1 - Recursively look for potential duplicates in tree directory using file sizes
# 2 - Then find real duplicates by generating md5 hash of potential duplicates
# 3 - Print relevant information

# recursively find all files in directory tree and print the sizes in bytes
find -not -empty -type f \( ! -iname ".*" \) -printf "%s\n" |\

    # sorts output (file sizes) numerically (-n) in reverse order (-r)
    sort -rn |\

    # uniq finds duplicate lines
    # -d: ignores duplicates
    uniq -d |\

    # xargs takes the output (file sizes)
    # and passes it as an argument to find

    # -I is the replacement argument and {} is a placeholder
    # now xargs will be executed once for each line of output from uniq

    # find will look for files
    # -size {}c means find will only look for files with correspondin size
    # c is for bytes

    # -print0: prints the full file name and takes care of white space
    xargs -I{} -n1 find -type f -size {}c -print0 |\

    # -0 takes care of blank space
    # md5sum generates md5 hash based on file content
    xargs -0 md5sum |\

    uniq -w32 --all-repeated=none > "$DIR/duplicates"

# we've got the duplicates, it's time to output the relevant information

# ouput format
# [file_number] files of size [file_size]
#   [path/file_name]

# store duplicates number in array
duplicates_number=( $(uniq -c -w32 "$DIR/duplicates" | awk '{print $1;}') )

# store sizes
sizes=( $(uniq -w32 "$DIR/duplicates" | cut -d' ' -f 3- | xargs -I{} find ~/Desktop/{} -printf "%s\n") )

# current line number
line=1

# output duplicates
for (( i=0; i<${#duplicates_number[@]}; i++ )); do
    echo ${duplicates_number[$i]} files of size ${sizes[$i]} KB:
    for (( j=0; j<${duplicates_number[$i]}; j++ )); do
        echo -e '\t' $( sed "${line}q;d" "$DIR/duplicates" | cut -d' ' -f3- )
        line=$(( $line+1 ))
    done
done

# we don't need the duplicates file anymore
rm "$DIR/duplicates"
