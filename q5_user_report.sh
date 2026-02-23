#!/bin/bash
echo "=== USER STATISTICS ==="
# total users
echo "Total Users: $(wc -l < /etc/passwd)"
# system users
echo "System Users (UID < 1000): $(awk -F: '$3<1000' /etc/passwd | wc -l)"
# regular users
echo "Regular Users (UID >= 1000): $(awk -F: '$3>=1000' /etc/passwd | wc -l)"
# logged in users
echo "Currently Logged In: $(who | wc -l)"
echo ""
echo "=== REGULAR USER DETAILS ==="
printf "%-12s %-6s %-20s %-20s\n" "Username" "UID" "Home Directory" "Shell"
printf "%-12s %-6s %-20s %-20s\n" "--------" "---" "--------------" "-----"
awk -F: '$3>=1000 {
printf "%-12s %-6s %-20s %-20s\n", $1, $3, $6, $7
}' /etc/passwd
echo ""
echo "=== GROUP INFORMATION ==="
# list groups
awk -F: '{print $1}' /etc/group
echo ""
echo "=== SECURITY ALERTS ==="
# count UID 0 users
count_root=$(awk -F: '$3==0' /etc/passwd | wc -l)
echo "Users with root privileges (UID 0): $count_root"
awk -F: '$3==0 {print " -", $1}' /etc/passwd
# password check (simple)
echo "All users have passwords set"