#!/bin/bash
read -p "Enter CHAIN : " CHAIN_ID
sleep 1
echo 'export CHAIN='$CHAIN_ID >> $HOME/.bash_profile
sleep 1
read -p "Enter DENOM: " DENOM
sleep 1
echo 'export DENOM='$DENOM >> $HOME/.bash_profile
source $HOME/.bash_profile
a=$((RANDOM % 120)) 
sleep $a
b=`$CHAIN_ID keys show wallet --bech val`
ollod  tx staking delegate $b 1000000$DENOM --from wallet --fees 5000$DENOM -y
