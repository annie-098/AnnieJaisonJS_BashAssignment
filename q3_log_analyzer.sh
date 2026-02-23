#!/bin/bash
# check argument
if [ $# -eq 0 ]; then
echo "Usage: ./log_analyzer.sh <logfile>"
exit 1
fi
file=$1
# check file exists
if [ ! -f "$file" ]; then
echo "File does not exist"
exit 1
fi
# check empty file
if [ ! -s "$file" ]; then
echo "File is empty"
exit 1
fi
echo "=== LOG FILE ANALYSIS ==="
echo "Log File: $file"
echo ""
# total entries
total=$(wc -l < "$file")
echo "Total Entries: $total"
echo ""
# unique IPs
echo -n "Unique IP Addresses: "
count_ips=$(awk '{print $1}' "$file" | sort | uniq | wc -l)
echo "$count_ips"
awk '{print $1}' "$file" | sort | uniq | while read ip
do
echo " - $ip"
done
echo ""
# status codes
echo "Status Code Summary:"
awk '{print $NF}' "$file" | sort | uniq -c | while read count code
do
echo " $code: $count requests"
done
echo ""
# most accessed page
echo "Most Accessed Page:"
awk '{print $7}' "$file" | sort | uniq -c | sort -nr | head -1 | while read count page
do
echo " $page - $count times"
done
echo ""
# top 3 IPs
echo "Top 3 IP Addresses:"
awk '{print $1}' "$file" | sort | uniq -c | sort -nr | head -3 | nl | while read num count ip
do
echo " $num. $ip - $count requests"
done
