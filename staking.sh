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

wget https://github.com/cryptoknight-dev/BitEsax/releases/download/bitesax1.0.0/bitesax-1.0.0-x86_64-linux-gnu.tar.gz
tar -xzf bitesax-1.0.0-x86_64-linux-gnu.tar.gz
rm -rf bitesax-1.0.0-x86_64-linux-gnu.tar.gz

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sudo ufw allow 9696/tcp
  
cd
mkdir -p .bitesax
echo "staking=1" >> bitesax.conf
echo "rpcuser=user" >> bitesax.conf
echo "rpcpassword=pass" >> bitesax.conf
echo "rpcallowip=127.0.0.1" >> bitesax.conf
echo "listen=1" >> bitesax.conf
echo "server=1" >> bitesax.conf
echo "daemon=1" >> bitesax.conf
echo "addnode=165.22.81.116" >> bitesax.conf
echo "addnode=165.22.94.252" >> bitesax.conf
echo "addnode=165.232.114.221" >> bitesax.conf
mv bitesax.conf .bitesax

  
cd
./bitesaxd -daemon
sleep 30
./bitesax-cli getinfo
sleep 5
./bitesax-cli getnewaddress
echo "Use the address above to send your BTX coins to this server"

