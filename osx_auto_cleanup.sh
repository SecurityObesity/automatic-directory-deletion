#!/bin/sh -e
if [[ $(id -u) -ne 0 ]];
then
	echo "Please run this script as root!";
	exit;
fi

# Sample directory path for deletion: $HOME/Library/Caches/Firefox/Profiles/<profilename>.default/OfflineCache/*

declare -a array=("$HOME/.cpan/build/*");

echo "\n";
echo "=======================================================================================";
echo "\n";
echo "       Developer Credit: dexoidan";
echo "       License: GNU Open Source";
echo "       Script Name: Simple automated forceable deletion for local files and directories";
echo "       Working systems: Mac OS X Darwin, Linux kernel with bash supported systems";
echo "       Run this script manually, automatically with scheduled tasks and remotely";
echo "\n";
echo "=======================================================================================";
echo "\n"
echo "[+] Following directories on the local harddrive will going to be deleted";
echo "[+] You need to be aware it is effective deletion that affects files and subdirectories";
number=1;
for item in ${array[*]}
do
	echo $number. $item;
	((number++));
done
if [ $1 == "--run" ];
then
	echo "[+] Effective deletion is ready to be processed and executed";
	read -p "Do you need verbosity in the deletion process? (yes/no) " verbosity
	read -p "Are you sure that you want to continue? (yes/no) " answer
fi

if [ $answer == "yes" ] || [ $1 == "--clean" ];
then
	echo "[+] Cleanup process has stared";
	for item in ${array[*]}
	do
		if [ $verbosity == "yes" ] || [ $2 == "--verbose" ];
		then
			sudo rm -rf -v $item;
		fi
		sudo rm -rf $item;
	done
	echo "[+] Checking the cleanup process";
	for item in ${array[*]}
	do
		if [ -d $item ]
		then
			echo "Directory path: " $item " has not been fully determinated";
			if [ $verbosity == "yes" ] || [ $2 == "--verbose" ];
			then
				sudo rm -rf -v $item;
			fi
			sudo rm -rf $item;		
		fi
		if [ ! -d $item ];
		then
			echo "[i] Directory path: " $item " has been deleted successfully.";
		fi
	done	
else
	echo "[!] Cleanup process has been killed and terminated";
	exit;
fi

echo "[+] Cleanup process ran successfully";
echo "[+] Task completion is now in the end";