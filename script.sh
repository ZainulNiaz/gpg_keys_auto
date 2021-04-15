#!/bin/bash
output=$(pwd)
FILE="/home/zainul/.gitconfig"
string=$(grep -w "signingkey"  "${FILE}")
echo "$string"
if [[ $string == *"signingkey"* ]];
then 
		echo "GPGKey already exists"
else
		echo "GPGkey doesnt exist... Creating a new key"
		gpg --gen-key
		z=$(gpg --list-keys | grep -A1 "pub   rsa" )
		x=${z:58}
		git config --global user.signingkey $x
		
fi


#z=$(gpg --list-keys | grep -A1 "pub   rsa" )
#x=${z:58}
#echo "${x}"
git config --global commit.gpgsign true
gpg --armor --export $x
echo "Copy and paste this in github/settings/ssh and gpg keys/gpg keys"
echo "completed"







# sed -i 's/\r$//'	script.sh	