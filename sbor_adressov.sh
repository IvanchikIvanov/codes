#!/bin/bash
#СДЕЛАТЬ НА ДВЕ ГРУППЫ 
#ВСЕ
cat 45.147.199.104/adress.csv 45.147.199.176/adress.csv 45.147.199.197/adress.csv 45.147.199.212/adress.csv 45.147.199.36/adress.csv 46.21.250.84/adress.csv 45.147.199.12/adress.csv 45.147.199.180/adress.csv 45.147.199.199/adress.csv 45.147.199.214/adress.csv 45.147.199.48/adress.csv 92.119.112.153/adress.csv 45.147.199.122/adress.csv 45.147.199.185/adress.csv 45.147.199.202/adress.csv 45.147.199.219/adress.csv 45.147.199.6/adress.csv 92.119.112.200/adress.csv 45.147.199.131/adress.csv 45.147.199.188/adress.csv 45.147.199.203/adress.csv 45.147.199.22/adress.csv 45.147.199.62/adress.csv 92.119.112.215/adress.csv 45.147.199.14/adress.csv 45.147.199.189/adress.csv 45.147.199.204/adress.csv 45.147.199.220/adress.csv 45.147.199.63/adress.csv 92.119.112.225/adress.csv 45.147.199.170/adress.csv 45.147.199.190/adress.csv 45.147.199.206/adress.csv 45.147.199.221/adress.csv 45.147.199.67/adress.csv 92.119.112.229/adress.csv 45.147.199.172/adress.csv 45.147.199.191/adress.csv 45.147.199.210/adress.csv 45.147.199.30/adress.csv 45.147.199.75/adress.csv 92.119.112.231/adress.csv 45.147.199.174/adress.csv 45.147.199.193/adress.csv 45.147.199.211/adress.csv 45.147.199.34/adress.csv 45.147.199.92/adress.csv 92.119.112.248/adress.csv > spisok.csv
#104
cat 45.147.199.104/adress.csv 45.147.199.12/adress.csv 45.147.199.122/adress.csv 45.147.199.131/adress.csv 45.147.199.14/adress.csv 45.147.199.219/adress.csv 45.147.199.22/adress.csv 45.147.199.220/adress.csv 45.147.199.221/adress.csv 45.147.199.30/adress.csv 45.147.199.34/adress.csv 45.147.199.36/adress.csv 45.147.199.48/adress.csv 45.147.199.6/adress.csv 45.147.199.62/adress.csv 45.147.199.63/adress.csv 45.147.199.67/adress.csv 45.147.199.75/adress.csv 45.147.199.92/adress.csv 92.119.112.200/adress.csv 92.119.112.215/adress.csv 92.119.112.225/adress.csv 92.119.112.231/adress.csv 92.119.112.248/adress.csv > spisok104.csv
#170
cat 45.147.199.170/adress.csv 45.147.199.172/adress.csv 45.147.199.174/adress.csv 45.147.199.176/adress.csv 45.147.199.180/adress.csv 45.147.199.185/adress.csv 45.147.199.188/adress.csv 45.147.199.189/adress.csv 45.147.199.190/adress.csv 45.147.199.191/adress.csv 45.147.199.193/adress.csv 45.147.199.197/adress.csv 45.147.199.199/adress.csv 45.147.199.202/adress.csv 45.147.199.203/adress.csv 45.147.199.204/adress.csv 45.147.199.206/adress.csv 45.147.199.210/adress.csv 45.147.199.211/adress.csv 45.147.199.212/adress.csv 45.147.199.214/adress.csv 46.21.250.84/adress.csv 92.119.112.153/adress.csv 92.119.112.229/adress.csv > spisok170.csv


WALLET_ADDRESS=$(okp4d keys show wallet -a)
echo $WALLET_ADDRESS &> adress.csv 
a=`hostname -i`

##  a=`curl https://ipinfo.io/ip`

scp adress.csv root@45.147.199.104:/root/BACKUP/$SRC/$a
