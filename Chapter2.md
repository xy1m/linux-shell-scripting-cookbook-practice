## 2.2 CAT
```
cat file
echo "haha" | cat file -
cat -s file //remove continuous space
cat $file | tr -s '\n' //remove space line
```

* \-b non black with line number
* \-n every line with line number
* \-e $ at end of line and -v
* \-t tab as ^I and -v
* \-v dispaly non-printing characters
* \-u disable output buffer

## 2.3 Record and replay
```
script -t 2> timing.log -a output.session
scriptreplay timing.log output.session

terminal 1: mkfifo scriptfifo
terminal 2: cat scriptfifo
terminal 1: script -f scriptfifo
// commands
```

## 2.4 File search and list
### name
```
find . -print  delim with '\n'
find . -print0 delim with '\0'
find . -name "simple.txt"
find . -iname "Sample.txt"
find . \( -name a.txt -o -name b.pdf \)
```
### path and regex
```
find . -path "str_in_path"
find . -regex "expression"
find . -iregex "ignore case"
find . ! -name "*.txt"
```
### depth
depth should be the 3rd parameter
```
find . -maxdepth 1 -type f
find . -mindepth 2 -type f
```
### type
* f file
* l link
* d directory

```
find . -type f
```
### time and size
```
find . -atime -7
find . -mtime 7
find . -ctime +7

find . -amin -7

find . -newer file.txt
find . -size -2k

find . -type f -name "*.swp" -delete
```
### permission and user
```
find . -type f -perm 644
find . -type f -user root
```
### execute command
```
find . -type f -exec chown zhengpengzhang {} \;
find . -type f -exec ./command.sh {} \;

find . \( -name "*.git" -prune \) -o \( -type f \)
```

## 2.5 xargs
### turn one line to multiple lines or reverse
```
cat example.txt | xargs
cat example.txt | xargs -n 3
```
### delimiter
```
xargs -d X
xargs -d X -n 2
```
### execute commands
```
cat args.txt | xargs -n 1 sh cecho.sh
cat args.txt | xargs -n 2 sh cecho.sh
cat args.txt | xargs sh cecho.sh
```
### TODO
```
cat args.txt | xargs -p arg1 -l
cat args.txt | xargs -I {} -l sh cecho.sh -p {} -l
```
### Tricky
```
// bad
find . -type f -name "*.txt" | xargs rm -f
// good
good: `find . -type f -name "*.txt" -print0 | xargs -0 rm -f
```

### for counting code lines
```
find . -type f -name "*.sh" -print0 | xargs -0 wc -l
```
### for multiple command
```
cat args.txt | ( while read arg; do echo $arg; echo $arg; done )
```

## 2.6 tr
### tr [options] set1 set2, translate from stdin to stdout, not arguments
```
cat args.txt | tr 'A-Z' 'a-z'
cat args.txt | tr '0-9' '9876543210'
```
### ROT13, shift 13 right positon
```
cat args.txt | tr 'abcdefghijklmnopqrstuvwxyz' 'nopqrstuvwxyzabcdefghijklm'
cat args.txt | tr '\t' '\0'
```
### delete characters
`tr -d '0-9'`
### not in set 1
`tr -c set1 set2`
### compress
`tr -s '[set]'`

### tricky
`cat sum.txt | echo $[ $(tr '\n' '+') 0 ]`
1+2...+5+0

```
// tr [:class:] [:class:]
alpha
digit
cntrl
lower
```

## 2.7 checksum
### sha1sum is the same
```
md5sum file
md5sum -c file_sum.md5
md5deep -rl path > directory.md5
md5sum -c directory.md5
```
## 2.8 order unique and repeat
### sort from stdin to stdout, uniq is the same
```
sort f1 f2 > res.txt
sort f1 f2 -o res.txt
```

* \-n number
* \-r reverse
* \-M month
* \-c check
* \-k column
* \-m mix and do have to re sort
* \-d dictionary
* \-b ignore space in front

column is seperated by space

// with \0 ending
sort -z data.txt | xargs -0

uniq requires sorted file or stdin, usually with sort

-u only show unique lines
-d duplicated
-c count
-s ignore n characters
-w max characters for comparation

tricky
INPUT='ahebhaaa'
OUTPUT =`echo $INPUT | sed '/[^\n]/&\n/g' | sed '/^$/d' | sort | uniq -c | tr -d '\n'`

## 2.9 temp file and random
```
${tempfile}
$RANDOM
$$ 
```
## 2.10 file split and data
// generate tmp file
dd if=/dev/zero bs=100k count=1 of=data.file
// split file
split -b 10k data.file prefix
-d digit
-a number length
prefix is last argument

//divide file based on noumber of lines
split -l 10 data.file

csplit server.log /SERVER/ -n 2 -s {*} -f server -b "%02d"; rm server00.log

## 2.11 split based on file name
```
file_jpg="sample.jpg"
//prefix
name=${file_jpg%.*}
//extension
extension=3${file_jpg#*.}

% not greedy and %% greedy
echo ${URL%.*}
echo ${URL%%.*}
echo ${URL#*.}
echo ${URL##*.}
```
## 2.12 move and copy in batch
```
rename 's/ /_/g' $file
find . -type f -name "*.mp3" -exec mv {} target_dir \;
```
## 2.13 spell check
```
word=$1
grep "^$1$" /usr/share/dict/web2 -q
[ $? -eq 0 ] && echo true || echo false
```
### TODO
```
output=`echo \"$word\" | aspell list`
[ -z $output ] && echo true || echo false
look word filepath
grep "^word" filepath
```
## 2.14 automatic

read -p "comments" var
see details for expect
