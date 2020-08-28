#Linux Terminal Learning Materials
#Credit: Joe Collins, thank you!
#https://www.youtube.com/watch?v=oxuRxtrO2Ag

#!!!SERIOUSLY DO NOT RUN THIS SCRIPT!!!#
#!!!THIS WILL DELETE EVERYTHING!!!#

#usr :~$ standard user, $standard, /root, #running as root

			#Basics
ls				#list storage, home dir holds files of users
pwd				#prints present working directory, path
ls Documents/			#relative path
ls /home/usr/Documents		#same output as above, absolute path
ls -a				#everything in directory, hidden included
ls -l				#long list of directories
ls -la				#everything in directory, long version
cd Doc*TAB*			#autocomplete to Documents
cd Do*TAB*			#prints possible autofills
cd ..				#up one level in directories
cd				#no arg, returns to home
cd ~				#also takes home
cd Documents
ls
cd Bash\ Scripts\ and\ Guides/	#\escape character (ignore things like spaces)
cd Downloads
pushd /etc			#moves from Downloads to etc
popd				#returns to Download
				#great for moving between two directories

cd
ls -a
file .face			#returns file type
file .ssr			#returns that .ssr is directory
locate fstab			#returns all files with fstab, locate uses database
sudo updatedb			#update database, autoupdated daily

which cal			#finds command in directory
cal 				#prints calendar
*UP ARROW*			#previous command
history 			#full command history
whatis cal			#describes command
apropos time			#returns commands related to "time"
man 				#manual

mkdir Junk Junk2		#makes two directories, Junk and Junk2
cd Junk
touch file1			#creates new file1
touch file1			#updates date on file
cp ~/.bashrc bashrc		#copies from home directory to directory as "bashrc"
cp bashrc bashrc.bak		#backup of bashrc file
mv bashrc.bak bashrc		#bashrc.bak overwrites bashrc
mv bashrc file1			#bashrc contents moved into file1
				#USE THE MAN PAGE FOR MV

			#BE CAREFUL WITH RM. ALSO USE THE MAN PAGE
rm file2			#removes file2
rm *				#removes all files in directory
rm file*			#removes all files that start with file in firectory
rm -r				#removes directory, recursive
rm -r*				#removes all files and directories
rmdir Junk2			#remove empty directory
mkdir dir1 dir2 dir3
rmdir *				#removes dir1, dir2, dir3

			#Text Files
				#linux settings stored in text files
cat file1			#list file contents
cat >> file2			#anything cat returns, put in file2
Hi
My name is user
*CTRL + D*			#finish
cat file2			#returns text
cat file 1 file2 		#concatenate file1 and file2
more file1			#allows to scroll page by page of file1
less file1			#scroll one line at a time, allow search, etc
*q*				#quit while using more or less
nano file2			#text editor
cat > file2			#new or overwrite file2
cat >> file2			#appends to file2
history | less			#takes output of history, shows details
ls -al / > lsout.txt		#list root directory, all, long, put into lsout.txt
less lsout.txt			#output file to screen

			#User-related Commands
sudo updatedb			#super user do; admin privilage;
sudo -s				#UBUNTU ONLY, maintains su privilage
exit				#exit su privilages
su - user2			#become user2, go to their directory
logout				#returns to previous user
su user2			#changes user, stay in directory
exit
su				#attempts to log in as root
su - 				#run as root, root directory
users				#prints logged in users
id				#account info

			#File Permissions
				#rwx permission options
				#r = read, 3 bits; w = write, 2 bits; x = executable, 1 bit;

/*
user	group	everyone
rwx	 rwx	 rwx
4,2,1	4,2,1	4,2,1
total	total	total

example:
755 = user rwx, group rx, everyone rx
				*/

cd Junk
ls -l
chmod +x file1			#give executable permission
chmod 700 file1			#exclusive permission to user
chmod 744 file1			#give read permission to all
chmod 644 file1			#default
chmod 755 file1			#executable to all, write exclusive to user

			#Task killer
watch free -h			#updates every 2 seconds
*CTRL + C*			#kills active command
killall firefox			#kills firefox, ONLY works if owner or su privilage
which google-chrome		#locates chrome
exit				#for real terminal
*CTRL + D*			#end session
logout				#logout
*CTRL + L*			#clears screen, aesthetic
*CTRL + SHIFT*			#increase font
*CTRL + -*			#decrease font
