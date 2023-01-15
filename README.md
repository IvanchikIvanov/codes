# codes
for lazy ppl
##### IT SHOW TIME! 
_____


+
+

CHAIN=
echo 'export CHAIN='$CHAIN >> $HOME/.bash_profile

CHAIN q bank balances $($CHAIN keys show wallet -a)   



CHAIN tx staking delegate $($CHAIN keys show wallet --bech val)  --from wallet --fees 5000 -y
