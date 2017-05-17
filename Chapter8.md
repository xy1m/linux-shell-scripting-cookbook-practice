## 8.2 Disk usage
df disk free
du disk used

du file1 file2
du directory
du -a directory

-a all
-h human readable
-c count
-s summarize
-b bytes
-k KB
-m MB
-B block

du --exclude "*.txt" files(directory)
du --exclude-from EXCLUDE.txt DIRECTORY

--max-depth
-x signle file system

du -ak SOURCE_DIR | sort -nrk 1 | head
find . -type f -exec du -k {} \; | sort -nrk 1 | head -n 4

df -h

## 8.3
time COMMAND

real -%e all time IO time, process time
user -%U 
sys -%S CPU time

/usr/bin/time -o output.txt COMMAND
/usr/bin/time -a -o output.txt COMMAND
/usr/bin/time -f "FORMAT STRING" COMMAND

## 8.4 current user, logs
list current users
who
w
users

uptime
last
last -f /var/log/wtmp

last USER
last reboot
lastb

## 8.5 list top 10 commands

cat ~/.bash_history | awk '{ list[$1]++; } END{for(i in list){printf "%s\t%d\n",i,list[i]}}' | sort -nrk 2 | head

## 8.6 list top 10 CPU process

## 8.7 watch

watch 'COMMAND'
watch -n 2 'ls -l'
execute COMMANDS every 2 seconds
highlight difference
watch -d 

## 8.8 file and folder access history
inotifywait

## 8.9 logrorate
/var/log/program.log {
	missingok
	notifyempty
	size 30k
		compress
	weekly
		rotate 5
	create 0600 root root
}

## 8.10 syslog

logger LOG_MESSAGE

write last line of other log into system log
logger -f /var/log/source.log

## 8.11 

## 8.12 Monitor remote disk

## 8.13 User activity



