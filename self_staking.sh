#!/bin/bash
if [ ! $CHAIN_ID ]; then
	read -p "Enter CHAIN: " CHAIN
	echo 'export CHAIN='$CHAIN >> $HOME/.bash_profile
fi
sleep 1
if [ ! $DENOM ]; then
	read -p "Enter DENOM: " DENOM
	echo 'export DENOM='$DENOM >> $HOME/.bash_profile
fi
sleep 1
if [ ! $ID ]; then
	read -p "Enter ID: " ID
	echo 'export ID='$ID >> $HOME/.bash_profile
fi
a=$((RANDOM % 12)) 
sleep $a
b=`$CHAIN keys show wallet --bech val`
$CHAIN tx staking delegate $b 1000000$DENOM --from wallet --chain-id=$ID --fees 500$DENOM -y

