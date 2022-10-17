#!/bin/bash
a=$((RANDOM % 3600)) 
sleep $a
mande-chaind tx staking create-validator \
--chain-id mande-testnet-1 \
--amount 0cred \
--pubkey "$(mande-chaind tendermint show-validator)" \
--from wallet \
--moniker $MONIKER\
--fees 1000mand
