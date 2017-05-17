## 7.2
### 1 print network list
`ifconfig | cut -c-10 | tr -d ' ' | tr -s '\n'`
### ifconfig inet | egrep -o "inet addr:[^ ]*" | egrep -o "[0-9.]*"

### 2 set up ip address
`ifconfig wlan0 192.168.0.80`
###  set up mask
`ifconfig wlan0 192.168.0.80 netmask 255.255.252.0`
### 3 set up MAC address
`ifconfig eth0 hw ether 00:1c:bf:87:25:d5`

### 4 DNS
`cat /etc/resolv.conf`
`echo nameserver ip >> /etc/resolv.conf`

one domain can be assigned multiple IPs and DNS only return one, if need all, DNS lookup tools are required

### host list all ips of one domain
host google.com
### nslookup list dns resource record
nslookup google.com
### add ip a symble link
`echo 192.168.0.9 backupserver.com >> /etc/hosts`
### route
route
route -n
route add default gw IP_ADRESS INTERFACE_NAME
### traceroute google.com

## 7.3 ping
ping IP_ADDRESS -c 2

### 7.4 list all machines
ping
fping
-a alive
-u unreachable
-g generate range
-d echo hostname

fping -a ip1 ip2 ip3
fping -a < ip.list
### fping to DNS loopup
fping -a -d 2>/dev/null < ip.list
### multi threads
() use for sub shell
& use for detach from current process
wait use for all sub shell finish
loop
do
()&
done
wait

### 7.5 transfer files
#### lftp

##### tp
-i ignore dialog
HOST='domain.com'
USER='foo'
PASSWORD='password'

ftp -i -n $HOST <<EOF
user $USER $PASSWORD
binary
cd /home/slynux
put testfile.jpg
get testfile.jpg
quit
EOF
#### sftp secure FTP
same with ftp
sftp -oPort=422 user@hostname

#### scp
scp file user@host:PATH
scp user@host:PATH filename
scp -r folder user@host:PATH

-p keep permission

### 7.6 script for setting WLAN

### 7.7 SSH key
#### key generation
ssh-keygen
#### ssh keys location
put id_rsa.pub in ~/.ssh/authorized_keys
put id_rsa in ~/.ssh/
#### more settings
/etc/ssh/sshd_config

ssh-keygen -t rsa

~/.ssh/id_rsa.pub
~/.ssh/id_rsa

ssh user@host "cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub

### 7.8 Execute remote command on remote machine
-p port
ssh user@host -p 422

ssh user@host 'COMMANDS'
ssh user@host 'COMMANDS' > stdout 2> error
echo 'COMMANDS' | ssh user@host > stdout 2> error
 
-C compress

echo text | ssh user@host 'cat >> list'
ssh user@host 'cat >> list' < file

### 7.9 sshfs
sshfs user@host:PATH /mnt/mountpoint
unmount /mnt/mountpoint

### 7.10 zenity

### 7.11 network and port analysis
#### lsof
lsof -i
#### list opened port
lsof -i | grep ":[0-9]\+->" -o | grep "[0-9]\+" -o | sort | uniq
#### netstat
netstat -tnp
