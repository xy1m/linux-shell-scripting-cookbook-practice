## Chapter 4

## 4.2 regex


## 4.3 grep

grep pattern filename
// for regex
grep -E regex_pattern
egrep regex_pattern
--color auto
-o only match
-v reverse
-c count for match line
// match word
egrep -o "[0-9]" | wc -l

-n print line number, with filename
-b character offset
-l in which file
-L not in which file

grep "text" . -R -n
-R recursive
-i ignore case
-e multiple match
grep -e "t1" -e "t2"
-f from pattern file, one line per pattern
--include file
--include-dir dir
--exclude file
--exclude-dir dir

grep "test" file -lZ | xargs -0 rm
// space
-A number of lines after
-B number of lines before
-C number of lines both
-A 1 use -- as seperator

## 4.4 cut
cut -f 2,3 filename
-s ignore lines without delimitor
tab as default delimitor
--complement for reverse set
-d delimitor
-b byte
-c character
-f field

3- from 3 to end
3-5 from 3 to 5 
-3 from 0-3

useful for -c -b
--output-delimiter ","

## 4.5 word count



## 4.7 awk

### 4.7.1
akw 'BEGIN { statements } pattern { statements } END { statements }'
### 4.7.2
print current without arguments
print v1,v2,v3 => v1 v2 v3
"" is used as concatenation operator

### 4.7.3
#### 1
Special Character
NR number of records
NF number of fileds
$0 whole line
$1 first field
$n nth field
$NF last field
$(NF-1) last 2 field

Examples
print lines
```
awk 'END{print NR}'
```
#### 2
use -v to pass variables to awk
```
var=100
echo | awk -v v1=$var'{ print v1}'
echo | awk '{print v1}' v1=$var
```

echo | awk ''
awk '' filename

#### 3. getline var
seq 5 | awk 'BEGIN{getline; print "first line:",$0} {print $0}'
#### 4. filter
awk 'NR<5'
awk 'NR==1,NR==4' or 'NR>=1&&NR<=4'
awk '/linux/' contains linux
awk '!/linux/' does not contain linux
#### 5. delimiter
awk -F: '{print $NF}' /etc/passwd
awk 'BEGIN{FS=":"} {print $NF}' /etc/passwd
#### 6 cmdout
"command" | getline cmdout
echo | awk '{ "grep root /etc/passwd" | getline cmdout; print cmdout }'
#### 7 loop in awk
for(int i=0;i<10;i++) {print $i}
for(i in array) { print array[i];}

- length(str)
- index(str,search_str)
- split(str,array,delimiter)
- substr(str,start,end)
- sub(regex, replacement_str,str)
- gsub(regex,replacement_str,str)
- match(regex, str) true non-zero, false zero, RSTART match start position, RLENGTH match length

### 4.8 Replace content of text or string
sed 's/pattern/replacement/g' filename
sed "s/$p/$r/g" filename
sed 's/patter/replacement' -i filename
sed 's/\n[0-9]\{3\}\b/NUMBER/g'

### 4.9 Javascript compress and decompress
tr -d '\n\r\t'
tr -s ' ' or sed 's/[ ]\+/ /g'
sed 's:/\*.*\*::g'
sed 's/ \?\([{ }();,:]\) \?/\1/g'

cat sample.js | tr -d '\n\r\t' | tr -s ' ' | sed 's/[ ]\+/ /g' | sed 's:/\*.*\*/::g' | sed 's/ \?\([{ }();,:]\) \?/\1/g'

cat output.js | sed 's/;/;\n/g; s/{/{\n/g; s/}/}\n/g'

### 4.10
loop line
cat file.txt | (while read line; do echo $line; done)
loop word
cat file.txt | (while read line; do for word in $line; do echo $word;done;done;)
loop character
for((i=0;i<$(#word);i++))
do
echo ${word:i:1}
done

### 4.11
default tab
paste paste1.txt paste2.txt -d 'delimiter'
### 4.12
awk '{ print $5 }' filename
awk 'NR==1,NR==5' filename
awk '/start_pattern/, /end_pattern/' filename

### 4.14
Palindrom

sed '/^\(.\)\(.\).\2\1/p'

[[ "malayalam"==`echo "malayalam" | rev` ]] && echo yes || echo no

reverse the sentence
echo $sentence | rev | tr ' ' '\n' | rev | tr '\n' ' '
### 4.15

Reverse output
seq 9 | awk '{arr[NR]=$0; count=NR} END {for(;count>=0;count--) {print arr[count]} }'

### 4.16

egrep -o [A-Za-z0-9.]+@[A-Za-z0-9.]+\.[A-Za-z]{2,4} url_email.txt

### 4.17

grep -A 3 //after 3 lines
grep -B 3 //before 3 lines
grep -C 3 //both before and after 3 lines

### 4.18
sed 's/ [^.]*mobile phones[^.]*\.//g'

### 4.19
head 
awk 'NR<=10' filename
tail
awk '{ buffer[NR %10] = $0;} END { for(i=1;i<11;i++) { print buffer[i%10] } }' filename
tac
awk '{arr[NR]=$0; count=NR} END {for(;count>=0;count--) {print arr[count]} }'

### 4.20

echo ${var/pattern/replacement}
echo ${var:start_position:length}
echo ${var:4}
echo ${var:4:8}
echo ${var:(-1)}
echo ${var:(-2),2}


