#!/bin/bash

OLLO_WALLET_ADDRESS=$(ollod keys show $WALLET -a)
OLLO_VALOPER_ADDRESS=$(ollod keys show $WALLET --bech val -a)
echo 'export OLLO_WALLET_ADDRESS='${OLLO_WALLET_ADDRESS} >> $HOME/.bash_profile
echo 'export OLLO_VALOPER_ADDRESS='${OLLO_VALOPER_ADDRESS} >> $HOME/.bash_profile
source $HOME/.bash_profile

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
$CHAIN tx staking delegate $OLLO_VALOPER_ADDRESS 1000000$DENOM --from wallet --chain-id=$ID --fees 500$DENOM -y
