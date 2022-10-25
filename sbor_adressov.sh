#!/bin/bash
WALLET_ADDRESS=$(okp4d keys show wallet -a)
$WALLET_ADDRESS > adress.csv 
a=`hostname -i`
scp adress.csv root@45.147.199.104:/root/BACKUP/$CHAIN/$a
