## 9.2
### Basic usage
ps
`PID TTY RUNTIME CMD`

* f full
* e every
* ax 
### Assign field
ps -o parameter1,parameter2...
`ps -eo comm,pcpu | head`

* pcpu cpu
* pid process id
* pid parent process id
* pmem process memory
* comm command
* cmd simple command
* user user
* nice niceness
* time all cpu time
* etime past time
* tty tty
* euid effective user id
* stat status

top

order

ps -eo comm,pcpu --sort -pcpu,+comm | head

ps -C command_name
ps -C command_name -o pid=

= remove header

pgrep COMMAND

pgrep COMMAND -d DELIMITER_STRING
pgrep bash -d ":"

filter user
pgrep -u root,slyunx COMMAND

command count
pgrep -c COMMAND

ps -u root -U root -o user,pcpu
-u effective user
-U real user

ps -t TTY1, TTY2

ps -eLf
NLWP number of threads of process
NLP thread ID

ps -ef
ps -e u
ps -e w

environment variables of process

ps -eo cmd e
ps -eo pid,cmd e

## 9.3 Kill process and send signal

kill -l
kill PROCESS_ID_LIST
kill -s SIGNAL PID

kill a group of commands

killall process_name
killall -s SIGNAL process_name
killall -9 process_name
killall -u username process_name
confirm before kill
killall -i process_name

pkill process_name
pkill -s SIGNAL process_name

### 2 catch and response signal
trap 'signal_handler_function_name' SIGNAL LIST

## 9.4
which // command path
whereis // command path, man and source
file // identify file type
whatis // short description of command

get load average, use uptime

## 9.5 send messages to terminals

echo "message" | wall

mesg y write message yes 
mesg n write message no

## 9.6 System information

hostname uname -n
uname -a core version
uname -m machine type x86_64

CPU information
cat /proc/cpuinfo
Processor information
cat /proc/cpuinfo | head -n 5 | head -1

cat /proc/meminfo
cat /proc/meminfo | head -1

cat /proc/partitions
fdisk -l
lshw

### 9.7 get information from /proc 

environ environment path
cwd process work folder link
fd file description

## 9.8 cron

crontab -e
02 02 * * * /bin/ls

1 crontab task.cron
2 crontab<<EOF
02 * * * * /home/slynux/script.sh
EOF

full path, and set environment varibales

crontab<<EOF
http_proxy=...
00 * * * * /bin/ls
EOF

### 2 cron table

crontabl -l
-u user
-r remove cron table of current user

## 9.9 MySQL

## 9.10 User management

useradd USER -p PASSWORD -m HOME -c FULLNAME

deluser USER 
--remove-all-files delete all user related files including HOME

chsh USER -s SHELL

usermod -L USER lock user
usermod -U USER unlock user

handle expired information

chage -E DATE
-m MIN_DAYS
-M MAX_DAYS
-W WARN_DAYS

change password
passwd USER

addgroup GROUP

addgroup USER GROUP

delgroup GROUP

figer USER
chage -l USER