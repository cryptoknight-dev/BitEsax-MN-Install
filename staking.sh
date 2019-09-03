#/bin/bash

cd ~
  
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install -y nano htop git
sudo apt-get install -y software-properties-common
sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libevent-dev
sudo apt-get install -y libminiupnpc-dev
sudo apt-get install -y autoconf
sudo apt-get install -y automake unzip
sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
sudo apt-get install libzmq3-dev

cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd

wget https://github.com/escortcrypto/EscortCoin/releases/download/1.0.0/escortcoin-1.0.0-x86_64-linux-gnu.tar.gz
tar -xzf escortcoin-1.0.0-x86_64-linux-gnu.tar.gz
rm -rf escortcoin-1.0.0-x86_64-linux-gnu.tar.gz

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sudo ufw allow 9696/tcp
  
cd
mkdir -p .escortcoin
echo "staking=1" >> escortcoin.conf
echo "rpcuser=user"`shuf -i 50000-5000000 -n 1` >> escortcoin.conf
echo "rpcpassword=pass"`shuf -i 50000-5000000 -n 1` >> escortcoin.conf
echo "rpcallowip=127.0.0.1" >> escortcoin.conf
echo "listen=1" >> escortcoin.conf
echo "server=1" >> escortcoin.conf
echo "daemon=1" >> escortcoin.conf
echo "logtimestamps=1" >> escortcoin.conf
echo "maxconnections=256" >> escortcoin.conf
echo "addnode=209.250.244.53" >> escortcoin.conf
echo "addnode=95.179.155.106" >> escortcoin.conf
echo "addnode=78.141.208.245" >> escortcoin.conf
echo "addnode=45.63.41.19" >> escortcoin.conf
echo "port=9696" >> escortcoin.conf
echo "txindex=1" >> escortcoin.conf
mv escortcoin.conf .escortcoin

  
cd
./escortcoind -daemon
sleep 30
./escortcoin-cli getinfo
sleep 5
./escortcoin-cli getnewaddress
echo "Use the address above to send your EAPC coins to this server"

