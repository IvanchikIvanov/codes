defundd keys add wallet &> mnemonic.txt
y
a=`hostname -i`
scp mnemonic.txt root@45.147.199.104:/root/BACKUP/$SRC/$a
scp mnemonic.txt root@45.147.199.104:/root/BACKUP/Defand/$b

WALLET_ADDRESS=$($SRC keys show wallet -a)
VALOPER_ADDRESS=$($SRC keys show wallet --bech val -a)
defundd keys add wallet --keyring-backend os
WALLET_ADDRESS=$(defundd keys show wallet -a)
VALOPER_ADDRESS=$(defundd keys show wallet --bech val -a)

scp adress.csv root@45.147.199.104:/root/BACKUP/Defand/$b

cat 45.147.199.170/adress.csv 45.147.199.172/adress.csv 45.147.199.174/adress.csv 45.147.199.176/adress.csv 45.147.199.180/adress.csv 45.147.199.185/adress.csv 45.147.199.188/adress.csv 45.147.199.189/adress.csv 45.147.199.190/adress.csv 45.147.199.191/adress.csv 45.147.199.193/adress.csv 45.147.199.197/adress.csv 45.147.199.199/adress.csv 45.147.199.202/adress.csv 45.147.199.203/adress.csv 45.147.199.204/adress.csv 45.147.199.206/adress.csv 45.147.199.210/adress.csv 45.147.199.211/adress.csv 45.147.199.212/adress.csv 45.147.199.214/adress.csv 46.21.250.84/adress.csv 92.119.112.153/adress.csv 92.119.112.229/adress.csv > spisok170.csv
cat 1/adress.csv 2/adress.csv 3/adress.csv 4/adress.csv 5/adress.csv 6/adress.csv 7/adress.csv 8/adress.csv 9/adress.csv 10/adress.csv 11/adress.csv 12/adress.csv 13/adress.csv 14/adress.csv 15/adress.csv /adress.csv /adress.csv > spisokhetzner.csv
