#!/bin/bash
# we have the moral and ethical right to plunder
# these protestants becouse they are not catolic !!!!
# ensure they go to deeper waters insteed of folowing human into dispear
# beaware its not tested !!!! careful it will fail many times before 
# its ready to use !!!!  do not run as root! do not relay on this!
# testing testing testing
# purpose: for fun, and not proper way at all!

#set -x
my_dir=`pwd`
prefered_format=text
mistash=~/Books/Gutenberg
mkdir -p $mistash
whale_id=$(( $RANDOM / 10000 + 1 ))
grabbeble_assets=(
  "http://gutenberg.org/ebooks/2529"
  "http://gutenberg.org/ebooks/690"
  "http://gutenberg.org/ebooks/1497"
  "http://www.gutenberg.org/ebooks/2701"
)

humpback_voice=(
  "http://soundbible.com/grab.php?id=68&type=wav"
  "http://soundbible.com/grab.php?id=744&type=wav"
  "http://soundbible.com/grab.php?id=985&type=wav"
  "http://soundbible.com/grab.php?id=227&type=wav"
  "http://soundbible.com/grab.php?id=226&type=wav"
)

# grab title author content language 
# price is less
say_it_in_welsh() {
 curl -G "${humpback_voice[$whale_id]}" -L -o /tmp/humpback.wav -s
 aplay /tmp/humpback.wav 2&> /dev/null 
}

handle_metha() {
	mapfile -t args < <( ./captains_elper.pi $asset )
	# author / title
	folder="~/Music/${args[1]}"/"${args[2]}"
	echo mkdir -p "$folder"
	echo cd "$folder"
	echo wget -c ${args[0]} 
	echo ${args[3]}  language
}

for asset in ${grabbeble_assets[*]}; do
	cd "$my_dir"
	handle_metha "$asset"
	say_it_in_welsh
done
