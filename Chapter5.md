## 6.2 tar

tar filename right after -f

tar -cf output.tar
tar -rvf archive.tar append_filename
tar -xf archive.tar -C path
tar -xvf archive.tar file1 file2

tar -Af file1.tar file2.tar
tar -df archive.tar file1 file2
tar -f archive.tar --delete file1 file2
tar --delete --file archive.tar file1
tar -cf arch.tar * --exclude "*.txt"
tar -cf arch.tar * -X list
tar --exclude-vcs -czvvf source_code.tar.gz src_of_code
tar -cf arch.tar * --totals

A append all contents of file2.tar to file1.tar
c create
d diff
r append file
u update only newer
x exact
f specify filename
v verbose
t look

compress

tar.gz
tar.bz2
tar.lzma
tar.lzo
-j bunzip2
-z gzip
--lzma lzma

## 6.3 cpio

## 6.4 gunzip gzip
gzip for single file
gzip delete filename file and create filename.gz
gunzip delete filename.gz and create filename

gzip -c // to stdout
cat file | gzip -c > file.gz
tar -czf x.tar.gz files
tar -caf x.tar.gz files
tar -rvf x.tar file

zcat test.gz
gzip -9 ratio highest

## 6.5 bzip2

bzip2 more ratio than gzip, command is the same -j for tar

## 6.6 lzma is the same
## 6.7 zip
zip 
zip -r // for folder
unzip
unzip -l // list contents
zip file.zip -u newfile
zip -d file.zip filename

## 6.9
### crypt

### gpg

### base64
base64 file > output
cat file | base64 > output
base64 -d file
cat file | base64 -d > output

### md5sum sha1sum
md5sum file
sha1sum file

### shadowlike

## 6.10 rsync
- a arrange
- v verbose
- z compress when transfer data

### basic usage
`rsync -av source_path destination_path`
### backup local to remote
`rsync -av source_path username@host:PATH`
### restore from remote 
`rsync -av username@host:PATH destination_path`
### cp contents of source_path
`rsync -av source_path/ destination_path`
### cp folder of source_path
`rsync -av source_path destination_path`
### exclude pattern
`rsync -av source_path destination_path --exculde PATTERN`
### exclude file list
`rsync -av source_path destination_path --exculde-from FILEPATH`
### delete unexist files
`rsync -av source_path destination_path --delete`
### useful when combine with crontab

## 6.1 Git
## 6.2 dd
### basic usage
`dd if=SOURCE of=TARGET bs=BLOCK_SIZE count=COUNT`
### cp partition to file
`dd if=/dev/sda1 of=sda1_partition.img`
### restore file to partition
`dd if=sda1_partition.img of=/dev/sda1`
### flush partition
`dd if=/dev/zero of=`



