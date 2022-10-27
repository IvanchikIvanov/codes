$SRC keys add wallet &> mnemonic.txt
y
a=`hostname -i`
scp mnemonic.txt root@45.147.199.104:/root/BACKUP/$SRC/$a
