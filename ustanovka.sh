!#/bin/bash


read -p "Enter GIT: " GIT
echo 'export GIT='$GIT >> $HOME/.bash_profile

read -p "Enter SRC: " SRC
echo 'export SRC='$SRC >> $HOME/.bash_profile

read -p "Enter Service: " Service
echo 'export Service='$Service >> $HOME/.bash_profile

read -p "Enter CHAIN_ID: " CHAIN_ID
echo 'export CHAIN_ID='$CHAIN_ID >> $HOME/.bash_profile

read -p "Enter SRC_GENESIS: " SRC_GENESIS
echo 'export SRC_GENESIS='$SRC_GENESIS >> $HOME/.bash_profile

read -p "Enter SRC_ADDRBOOK: " SRC_ADDRBOOK
echo 'export SRC_ADDRBOOK='$SRC_ADDRBOOK >> $HOME/.bash_profile

read -p "Enter SRC_DENOM: " SRC_DENOM
echo 'export SRC_DENOM='$SRC_DENOM >> $HOME/.bash_profile

read -p "Enter SRC_SEEDS: " SRC_SEEDS
echo 'export SRC_SEEDS='$SRC_SEEDS >> $HOME/.bash_profile


# GIT=https://github.com/okp4/okp4d.git
# SRC=okp4d
# CHAIN_ID="okp4-nemeton"
# SRC_PORT=39
# SRC_GENESIS="https://raw.githubusercontent.com/okp4/networks/main/chains/nemeton/genesis.json"
# SRC_ADDRBOOK="https://raw.githubusercontent.com/obajay/nodes-Guides/main/OKP4/addrbook.json"
# SRC_DENOM=usource
# SRC_SEEDS=6ca675f9d949d5c9afc8849adf7b39bc7fccf74f@164.92.98.17:26656
# SRC_PEERS="f595a1386d5ca2e0d2cd81d3c6372c3bf84bbd16@65.109.31.114:2280,a49302f8999e5a953ebae431c4dde93479e17155@162.19.71.91:26656,dc14197ed45e84ca3afb5428eb04ea3097894d69@88.99.143.105:26656,79d179ea2e1fbdcc0c59a95ab7f1a0c48438a693@65.108.106.131:26706,501ad80236a5ac0d37aafa934c6ec69554ce7205@89.149.218.20:26656,5fbddca54548bf125ee96bb388610fe1206f087f@51.159.66.123:26656,769f74d3bb149216d0ab771d7767bd39585bc027@185.196.21.99:26656,024a57c0bb6d868186b6f627773bf427ec441ab5@65.108.2.41:36656,fff0a8c202befd9459ff93783a0e7756da305fe3@38.242.150.63:16656,2bfd405e8f0f176428e2127f98b5ec53164ae1f0@142.132.149.118:26656,bf5802cfd8688e84ac9a8358a090e99b5b769047@135.181.176.109:53656,dc9a10f2589dd9cb37918ba561e6280a3ba81b76@54.244.24.231:26656,085cf43f463fe477e6198da0108b0ab08c70c8ab@65.108.75.237:6040,803422dc38606dd62017d433e4cbbd65edd6089d@51.15.143.254:26656,b8330b2cb0b6d6d8751341753386afce9472bac7@89.163.208.12:26656"

#INSTALL
cd $HOME
git clone $GIT
cd $SRC
make install

$Service init $OKPDNAME --chain-id $CHAIN_ID

cd $HOME
wget -qO $HOME/.$SRC/config/genesis.json $SRC_GENESIS
wget -O $HOME/.$SRC/config/addrbook.json $SRC_ADDRBOOK

echo -e "                     \e[1m\e[32m4. Node optimization and improvement--> \e[0m" && sleep 1

sed -i.bak -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.025$SRC_DENOM\"/;" ~/.$SRC/config/app.toml
sed -i -e "s/^filter_peers *=.*/filter_peers = \"true\"/" $HOME/.$SRC/config/config.toml
external_address=$(wget -qO- eth0.me) 
sed -i.bak -e "s/^external_address *=.*/external_address = \"$external_address:26656\"/" $HOME/.$SRC/config/config.toml
peers=$SRC_PEERS
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$peers\"/" $HOME/.$SRC/config/config.toml
seeds=$SRC_SEEDS
sed -i.bak -e "s/^seeds =.*/seeds = \"$seeds\"/" $HOME/.$SRC/config/config.toml

# pruning and indexer
pruning="custom"
pruning_keep_recent="100"
pruning_keep_every="0"
pruning_interval="10"
sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $HOME/.$SRC/config/app.toml
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $HOME/.$SRC/config/app.toml
sed -i -e "s/^pruning-keep-every *=.*/pruning-keep-every = \"$pruning_keep_every\"/" $HOME/.$SRC/config/app.toml
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $HOME/.$SRC/config/app.toml
indexer="null" && \
sed -i -e "s/^indexer *=.*/indexer = \"$indexer\"/" $HOME/.$SRC/config/config.toml


sudo tee /etc/systemd/system/$SRC.service > /dev/null <<EOF
[Unit]
Description=$SRC
After=network-online.target

[Service]
User=$USER
ExecStart=$(which $SRC) start
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

# start service
sudo systemctl daemon-reload
sudo systemctl enable $SRC
sudo systemctl restart $SRC && sudo journalctl -u $SRC -f -o cat


















