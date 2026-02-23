Name: Annie Jaison J S
CyberSecurity and Ethical Hacking Intern
Bash Scripting Assignment

Questions Attempted:
Q1 - System Information Script
Q2 - File and Directory Manager
Q3 - Log File Analyzer
Q4 - Backup Script
Q5 - User Report Script


-->HOW TO RUN SCRIPTS

1. System Info:
chmod +x system_info.sh
./system_info.sh

2. File Manager:
chmod +x q2_file_manager.sh
./q2_file_manager.sh

3. Log Analyzer:
chmod +x q3_log_analyzer.sh
./q3_log_analyzer.sh access.log

4. Backup Script:
chmod +x q4_backup.sh
./q4_backup.sh

5. User Report:
chmod +x q5_user_report.sh
sudo ./q5_user_report.sh
./q5_user_report.sh > user_report.txt


-->SAMPLE TEST CASES

Q1:
Run script → displays username, hostname, date, etc.

Q2:
Choice 1 → Lists files
Choice 2 → Creates directory
Choice 3 → Creates file
Choice 4 → Deletes file (with confirmation)
Choice 5 → Rename file
Choice 6 → Search for a file
Choice 7 → Counts files and directories
Choice 8 → To Exit

Q3:
Input: access.log
Output: Total entries, IPs, status codes, top IPs

Q4:
Input:
Source → test_backup
Destination → backup
Choice → 2
Output → Creates .tar.gz backup file

Q5:
Displays:
- Total users
- Regular users
- User details table
- Security alerts


-->CHALLENGES FACED

- Faced issue with awk formatting for table output
- echo not working inside awk (used printf instead)
- lastlog command not available in system
- Handling file not found errors in log analyzer
- Aligning output properly using tabs/printf
- Formatting and braces 
