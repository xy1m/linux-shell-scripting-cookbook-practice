## Chapter 3

## 3.2 generate file

dd if=/dev/zero/ of=junk.data bs=1m count=1
if=stdin, file
of=stdout, file
bs=binary size
count=time

## 3.3 diff
comm a b
-1 delete first column
-2 delele second column
-3 delete third column

1: only appears in a
2: only appears in b
3: both

## 3.4 delete duplicated files

## 3.5 make long dir
[ -e file ] check file exist?
mkdir -p /home/root/test/hello/child

## 3.6 permission

folder
r read
w write
x access
S setuid, execute as owner

// folder has a permission sticky bit, only user who create the folder can delete files under folder
T x with sticky bit, T
t no x with sticky bit, t

chmod u=rwx g=rw o=r filename
chmod o+x filename
chmod a+x filename
chmod 764 filename

chown user.group filename
chmod a+t dirctory
chmod 777 . -R
chown user.group . -R

chmod +s executable_file

## 3.7 Immutable

## 3.8 Blank file

touch
-a access time
-m modification time
-d "date"

## 3.9

ln -s target symbolic_link_name
find .type l
ls -l grep "^1" | awk '{ print $8 }'

## 3.10 file stat
## 3.11
## 3.12
## 3.13

diff a.txt b.txt
diff -u a.txt b.txt
// redo
patch -p1 version.txt < version.patch
diff -Naur a.txt b.txt

## 3.14

head a.txt
// print top 4
head -n 4 a.txt
// print everyline except last N line
head -n -N file
// print last N lines

tail is the same
-f --follow
--pid $PID

when $PID close, tail close

## 3.15 only show folder

ls -d */
ls -F | grep "/$"
ls -l | grep "^d"
find . -type d -maxdepth 1 -print

## 3.16 pushd popd
pushd +n
popd +n
cd - enter last folder

## 3.17 lines words characters
echo -n 1234, n is use for avoid \n
wc [options] file
-l line
-w word
-c character
-L longest length
wc file will list line word and characters

## 3.18 folder tree

tree path
// meet pattern
tree path -P pattern
// inverse pattern
tree path -I pattern
//size
tree path -h 
tree path -H http://localhost -o out.html
