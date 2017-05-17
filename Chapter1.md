## 1.1 Basic
### Assign shebang
`#!/bin/bash`
### Print Variable
```
echo "$PWD"
echo $PWD
```
### Print orignal characters
`echo '$PWD'`
### Print special character
`echo h\;h`

## 1.2 Output
* echo -n no \n at the end of line
* echo -e special output

### Simple output
```
echo "Hello World!"
echo -n "Hello";echo "World"
echo -e "1\t2\t3"
```
### Format output
* (\-) align from left

```
printf "%-5s %-10s %-4.2f\n" Apple Banana 123.45678
printf "%5s %5s %2.2f\n" An AppleBanana 123456789.0001
```
### Color output
```
#0=reset 30=black 31=red 32=green 33=yellow 34=blue 35=foreign red 36=light blue 37=white
#0=reset 40=black 41=red 42=green 43=yellow 44=blue 45=foreign red 46=light blue 47=white
echo -e "\e[1;31m This is red text \e[0m"
echo -e "\e[1;42m This is green background \e[0m"
```

## 1.3 Varibles and environment varibles
```
env
cat /proc/$PID/environ | tr ‘\0’ ’\n’
pgrep Google Chrome
```
### Varibles
```
var=value
echo $var
echo ${var}
```
### Environment varibles
Environment varibles are not defined in current process but extend from parent process, export is for environment varibles, standard environment varibles are in $PATH
```
export PATH="$PATH:/home/usr/bin"
or
PATH="$PATH:/home/usr/bin"
export PATH
```
### Trickies
* length=${#var}
* echo $SHELL, echo $0
* $UID eq 0 is root
* space between [ and ] [ $UID -ne 0 ]
### Promot
PS1 in .bashrc or .bash_profile, could combined with color output
`PS1='\u@\h:\w$ '`

## 1.4 Calculation in SHELL
let () []
```
no1=4;
no2=5;
let res=no1+no2;
echo $res

let no1++
let no1--
let no1+=6

res=$[no1+no2]
res=$[ no1+no2 ]
res=$[ $no1+$no2 ]
res=$(( no1+50 ))

// space required
res=`expr 3 + 4`
// space required
res=$(expr $no1 + 5)
```
### Advanced calculation
Other operation ahead and seperate with ; ibase is current and obase is target
```
echo "4 * 0.56" | bc
echo "$no1 * 0.56" | bc
echo "scale=2;3/8" | bc
no=100
echo "obase=2;$no" | bc
echo "obase=10;ibase=2;$no" | bc
echo "sqrt(100)" | bc
echo "10^10" |bc
```

## 1.5 stdin, stdout and stderr
$? eq 0 is the signal for success
### redirect stdout and stderr to different files
`cmd 1>out 2>err`
### redirect stdout to stderr and both to file
`cmd 2>&1 out` or `cmd &> out`
### dispose stdout or stderr
`cmd 1> /dev/null` or `cmd 2> /dev/null`
### redirect continuously
```
cmd | tee out | cat -n
cmd | tee -a append_out | cat -n
echo who is this | tee 
cat file | cmd  == cmd < file
```
### redirect text block
```
cat <<EOF>log.txt
Something
EOF
```
### Custom file descriptor
* readonly
* override
* append

```
exec 3<input.txt
cat <&3

exec 4>output.txt
echo newline >&4
cat output.txt
```

## 1.6 Array
basic array and relation array (map)
### basic array
```
array_var=(1 2 3)
or
array_var[0]="1"
array_var[1]="2"
array_var[2]="3"

echo ${array_var[0]}
index=5
echo ${array_var[$index]}

print all varibles
echo ${array_var[*]}
echo ${array_var[@]}
length
echo ${#array_var[*]}
```
### relation array
```
declare -A map
map=([index1]=1 [index2]=2)
or
map[index1]=1
map[index2]=2

echo ${!array_var[*]}
echo ${!array_var[@]}
```

## 1.7 Alias
alias in .bashrc or .bash_profile
unalias to cancel alias

alias new_command='sudo apt-get install'
alias rm='cp $@ ~/backup; rm $@';
### Note
escape \ to avoid alias
\ls is to use original ls

## 1.8 Terminal information
tput cols
tput lines
tput longname
tput cup 100 100
tput setb no
tput serf no
tput bold
tput smu1
tput rmu1
tput ed

```
#!/bin/bash
echo -e "Password:"
# no output to terminal
stty -echo
read password
stty echo
echo
echo Password read
```

## 1.9 Date and sleep
### Date
date
date +%s
date --date "Jan 20 2001" +%A

* %a %A week
* %b %B month
* %d %D day
* %y %Y year
* %I %H hour
* %M minute
* %S seconds
* %N na seconds
* %s utc

```
#!/bin/bash
start=$(date +%s)
commands;
end=$(date +%s)
difference=$(( end - start ))
echo time taken $difference seconds.
```
### Sleep
```
#!/bin/bash
#Filename: sleep.sh

echo -n Count:
tput sc

count=0;
while true;
do
	if [ $count -lt 10 ];
	then let count++;
		sleep 1;
		tput rc
		tput ed
		echo -n $count;
	else
		echo
		echo "wake up after $count seconds"
		exit 0;
	fi
done
```

## 1.10 Debug
```
bash -x script.sh
set -x // enable debug
set +x // disable debug
set -v // enable verbose
set +v // disable verbose
```
## 1.11 Function and parameters
```
function DEBUG() {
	[ "$_DEBUG" == "on" ] && $@ || :
}

for i in {1..10}
do
DEBUG echo $i
done
```
### trick
`#/bin/bash -xv`

## Function
```
function fun() {
	//
}

fun() {
	//
}

fun 1 2 

fun() {
	echo $1;
	fun hello;
	sleep 1;
}

echo $1 $2 $n
echo $@ // all args considered as multiple strings
echo $* // all args considered as signle string
```
## 1.12 COMMAND sequences
subshell with independent process
```
cmd=$(ls | cat -n)
or
cmd=`ls | cat -n`

pwd;
(cd /bin;ls);
pwd;

keep space and \n
before
out=(cat tex.txt)
// lost \n
1 2 3

after
out="$(cat tex.txt)"
echo $out
// remain \n
1
2
3
```
## 1.13 Read
```
// with out return
read -n 2 var
// password
read -s password
// promot
read -p "Enter input:" var
// timeout
read -t timeout var
// delimeter
read -d ":" var
```

## 1.14 Internal Field Separator IFS
oldIFS=$IFS
IFS=;
IFS=$oldIFS
### for loop
```
echo {1..50}
echo {a..z}

for var in list
do
commands
done

for((i=0;i<10;i++)) {
	echo $i
}

while condition
do
commands
done

until condition
do
commands
done
```

## 1.15 Comparation and test

```
if true
then
//
elif true
then
//
else
//
fi
```
### Short

[ ture ] && action
[ false ] && action

### Comparation

* -gt greater than
* -lt lesser than
* -ge greater or equals than
* -le lesser or equals than
* -eq equals
* ne not equals

### File system test
`[[ -f ./debug.sh ]] && echo yes`

* -f file or file path?
* -x executable? 
* -d directory?
* -e exist?
* -c character file?
* -b blob file?
* -w writable?
* -r readable?
* -L link?

### String comparation
= arount space is comparation
= without space is assign value

```
[[ $str1 = $str2 ]]
[[ $str1 == $str2 ]]
[[ $str1 != $str2 ]]
[[ $str1 > $str2 ]]
[[ -z $str1 ]] true if empty
[[ -n $str1 ]] true if not empty

if test $var -eq 0; then echo "true"; fi;
[ $var -eq 0 ] && echo true;
```










