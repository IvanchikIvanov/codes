#!/bin/bash
echo "Enter CHAIN : " 
read CHAIN_ID
sleep 1
echo "Enter DENOM: " 
read DENOM
sleep 1
a=$((RANDOM % 12)) 
sleep $a
b=`$CHAIN_ID keys show wallet --bech val`
ollod  tx staking delegate $b 1000000$DENOM --from wallet --fees 500$DENOM -y
