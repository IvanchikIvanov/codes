#!/bin/bash
if [ ! $CHAIN_ID ]; then
	read -p "Enter CHAIN_ID: " CHAIN_ID
	echo 'export CHAIN_ID='$CHAIN_ID >> $HOME/.bash_profile
fi
sleep 1
if [ ! $DENOM ]; then
	echo 'export DENOM='$DENOM >> $HOME/.bash_profile
fi
a=$((RANDOM % 12)) 
sleep $a
b=`$CHAIN_ID keys show wallet --bech val`
ollod tx staking delegate $b 1000000$DENOM --from wallet --fees 500$DENOM -y
