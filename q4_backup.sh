#!/bin/bash
echo "=== AUTOMATED BACKUP SCRIPT ==="
echo ""
# take inputs
read -p "Enter directory to backup: " source
read -p "Enter backup destination: " dest
echo "Backup Type:"
echo "1. Simple copy"
echo "2. Compressed archive (tar.gz)"
read -p "Enter choice: " choice
# check source exists
if [ ! -d "$source" ]; then
echo "Source directory does not exist"
exit 1
fi
# create destination if not exists
mkdir -p "$dest"
# timestamp
timestamp=$(date +%Y%m%d_%H%M%S)
echo ""
echo "[*] Starting backup..."
echo "[*] Source: $source"
echo "[*] Destination: $dest"
# start time
START=$(date +%s)
# backup process
if [ "$choice" -eq 1 ]; then
echo "[*] Creating simple copy..."
cp -r "$source" "$dest/backup_$timestamp"
backup_file="$dest/backup_$timestamp"
elif [ "$choice" -eq 2 ]; then
echo "[*] Creating compressed archive..."
tar -czf "$dest/backup_$timestamp.tar.gz" "$source"
backup_file="$dest/backup_$timestamp.tar.gz"
else
echo "Invalid choice"
exit 1
fi
echo ""
# end time
END=$(date +%s)
DURATION=$((END - START))
# check success
if [ -e "$backup_file" ]; then
echo "Backup completed successfully!"
else
echo "Backup failed!"
exit 1
fi
# get size
size=$(du -sh "$backup_file" | awk '{print $1}')
echo ""
# summary
echo "Backup Details:"
echo " File: $(basename "$backup_file")"
echo " Location: $dest"
echo " Size: $size"
echo " Time taken: $DURATION seconds"