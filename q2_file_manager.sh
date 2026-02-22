#!/bin/bash
# Simple File and Directory Manager
while true
do
echo "FILE & DIRECTORY MANAGER"
echo "1. List files in current directory"
echo "2. Create a new directory"
echo "3. Create a new file"
echo "4. Delete a file"
echo "5. Rename a file"
echo "6. Search for a file"
echo "7. Count files and directories"
echo "8. Exit"
read -p "Enter your choice: " choice
case $choice in
1)  #List files in current directory
echo "Files in current directory:" 
ls -lh
;;  
2)  #Create a new directory
read -p "Enter directory name: " dirname
if [ -d "$dirname" ]; then
echo "Directory already exists"
else
mkdir "$dirname"
echo "Directory created"
fi
;;
3)   #Create a new file
read -p "Enter file name: " filename
if [ -f "$filename" ]; then
echo "File already exists"
else
touch "$filename"
echo "File created"
fi
;;
4)   #Delete a file
read -p "Enter file name to delete: " filename
if [ -f "$filename" ]; then
rm "$filename"
echo "File deleted"
else
echo "File does not exist"
fi
;;
5)  #Rename a file
read -p "Enter old file name: " oldname
read -p "Enter new file name: " newname
if [ -f "$oldname" ]; then
mv "$oldname" "$newname"
echo "File renamed"
else
echo "File not found"
fi
;;
6)   # Search for a file
read -p "Enter file name to search: " name
find . -name "$name"
;;
7)   #Count files and directories
files=$(find . -type f | wc -l)
dirs=$(find . -type d | wc -l)
echo "Files: $files"
echo "Directories: $dirs"
;;
8)    #to exit
echo "Exiting..."
break
;;
*)   #default case: if number other than 1 to 8 is entered
echo "Invalid choice"
;;
esac
done