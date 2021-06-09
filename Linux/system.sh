#!/bin/bash
free -h > ~/Projects/backups/freemem/free_men.txt
du -h > ~/Projects/backups/diskuse/disk_usage.txt
lsof > ~/Projects/backups/openlist/open_list.txt
df -h > ~/Projects/backups/freedisk/free_disk.txt
