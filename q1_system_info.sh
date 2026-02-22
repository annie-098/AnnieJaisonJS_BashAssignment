#!/bin/bash
# storing values in variables
username=$(whoami)
hostname=$(hostname)
date_time=$(date)
os=$(uname -s)
current_dir=$(pwd)
home_dir=$HOME
users=$(who | wc -l)
uptime=$(uptime)
disk=$(df -h /)
memory=$(free -h)
# printing output
echo "   SYSTEM INFORMATION DISPLAY"
echo "Username       : $username"
echo "Hostname       : $hostname"
echo "Date & Time    : $date_time"
echo "OS             : $os"
echo "Current Dir    : $current_dir"
echo "Home Dir       : $home_dir"
echo "Users Online   : $users"
echo "Uptime         : $uptime"
echo "Disk Usage:"
echo "$disk"
echo "Memory Usage:"
echo "$memory"
