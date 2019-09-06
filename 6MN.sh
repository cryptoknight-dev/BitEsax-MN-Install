#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"Welcome to the EscortCoin Automated Install, Durring this Process Please Hit Enter or Input What is Asked."${NC}
echo
echo -e ${YELLOW}"You Will See alot of code flashing across your screen, don't be alarmed it's supposed to do that. This process can take up to an hour and may appear to be stuck, but I can promise you it's not."${NC}
echo
echo -e ${GREEN}"Are you sure you want to install a EscortCoin Masternode? type y/n followed by [ENTER]:"${NC}
read AGREE

if [[ $AGREE =~ "y" ]] ; then
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the first node:"${NC}
read privkey
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for second node:"${NC}
read privkey2
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the third node:"${NC}
read privkey3
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 4th node:"${NC}
read privkey4
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 5th node:"${NC}
read privkey5
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 6th node:"${NC}
read privkey6
echo "Creating 6 EscortCoin system users with no-login access:"
sudo adduser --system --home /home/escortcoin escortcoin
sudo adduser --system --home /home/escortcoin2 escortcoin2
sudo adduser --system --home /home/escortcoin3 escortcoin3
sudo adduser --system --home /home/escortcoin4 escortcoin4
sudo adduser --system --home /home/escortcoin5 escortcoin5
sudo adduser --system --home /home/escortcoin6 escortcoin6
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common 
sudo apt-get -y install build-essential  
sudo apt-get -y install libtool autotools-dev autoconf automake  
sudo apt-get -y install libssl-dev 
sudo apt-get -y install libevent-dev 
sudo apt-get -y install libboost-all-dev 
sudo apt-get -y install pkg-config  
sudo add-apt-repository ppa:bitcoin/bitcoin 
sudo apt-get update 
sudo apt-get -y install libdb4.8-dev 
sudo apt-get -y install libdb4.8++-dev 
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5 
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
#sudo apt install git 
cd /var 
sudo touch swap.img 
sudo chmod 600 swap.img 
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000 
sudo mkswap /var/swap.img 
sudo swapon /var/swap.img 
sudo echo ' /var/swap.img none swap sw 0 0 ' >> /etc/fstab
cd ~ 
sudo mkdir /root/eapc
cd /root/eapc
wget https://github.com/escortcrypto/EscortCoin/releases/download/1.0.0/escortcoin-1.0.0-x86_64-linux-gnu.tar.gz
tar -xzvf escortcoin-1.0.0-x86_64-linux-gnu.tar.gz
sudo mv /root/eapc/escortcoind /root/eapc/escortcoin-cli /root/eapc/escortcoin-tx /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/escortcoin*
sudo mkdir /home/escortcoin/.escortcoin
sudo touch /home/escortcoin/.escortcoin/escortcoin.conf
echo -e "${GREEN}Configuring Wallet for first node${NC}"
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "rpcallowip=127.0.0.1" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "server=1" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "daemon=1" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "maxconnections=250" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "masternode=1" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "rpcport=6943" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "listen=0" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9696" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "masternodeprivkey=$privkey" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=209.250.233.104" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=45.77.82.101" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=138.68.167.127" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=207.246.86.118" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.247" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.246" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.245" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.244" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.243" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.242" >> /home/escortcoin/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.241" >> /home/escortcoin/.escortcoin/escortcoin.conf
sleep 5
echo -e "${GREEN}Configuring Wallet for second node${NC}"
sudo mkdir /home/escortcoin2/.escortcoin
sudo touch /home/escortcoin2/.escortcoin/escortcoin.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "rpcallowip=127.0.0.1" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "server=1" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "daemon=1" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "maxconnections=250" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "masternode=1" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "rpcport=6944" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "listen=0" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9696" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "masternodeprivkey=$privkey2" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=209.250.233.104" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=45.77.82.101" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=138.68.167.127" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=207.246.86.118" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.247" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.246" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.245" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.244" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.243" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.242" >> /home/escortcoin2/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.241" >> /home/escortcoin2/.escortcoin/escortcoin.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for third node${NC}"
sudo mkdir /home/escortcoin3/.escortcoin
sudo touch /home/escortcoin3/.escortcoin/escortcoin.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "rpcallowip=127.0.0.1" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "server=1" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "daemon=1" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "maxconnections=250" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "masternode=1" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "rpcport=6945" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "listen=0" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9696" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "masternodeprivkey=$privkey3" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=209.250.233.104" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=45.77.82.101" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=138.68.167.127" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=207.246.86.118" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.247" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.246" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.245" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.244" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.243" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.242" >> /home/escortcoin3/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.241" >> /home/escortcoin3/.escortcoin/escortcoin.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 4th node${NC}"
sudo mkdir /home/escortcoin4/.escortcoin
sudo touch /home/escortcoin4/.escortcoin/escortcoin.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "rpcallowip=127.0.0.1" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "server=1" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "daemon=1" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "maxconnections=250" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "masternode=1" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "rpcport=6946" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "listen=0" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9696" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "masternodeprivkey=$privkey4" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=209.250.233.104" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=45.77.82.101" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=138.68.167.127" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=207.246.86.118" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.247" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.246" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.245" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.244" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.243" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.242" >> /home/escortcoin4/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.241" >> /home/escortcoin4/.escortcoin/escortcoin.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 5th node${NC}"
sudo mkdir /home/escortcoin5/.escortcoin
sudo touch /home/escortcoin5/.escortcoin/escortcoin.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "rpcallowip=127.0.0.1" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "server=1" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "daemon=1" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "maxconnections=250" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "masternode=1" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "rpcport=6947" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "listen=1" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9696" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "masternodeprivkey=$privkey5" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=209.250.233.104" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=45.77.82.101" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=138.68.167.127" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=207.246.86.118" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.247" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.246" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.245" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.244" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.243" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.242" >> /home/escortcoin5/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.241" >> /home/escortcoin5/.escortcoin/escortcoin.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 6th node${NC}"
sudo mkdir /home/escortcoin6/.escortcoin
sudo touch /home/escortcoin6/.escortcoin/escortcoin.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "rpcallowip=127.0.0.1" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "server=1" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "daemon=1" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "maxconnections=250" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "masternode=1" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "port=9696" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "listen=1" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9696" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "masternodeprivkey=$privkey6" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=209.250.233.104" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=45.77.82.101" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=138.68.167.127" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=207.246.86.118" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.247" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.246" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.245" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.244" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.243" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.242" >> /home/escortcoin6/.escortcoin/escortcoin.conf
echo "addnode=149.56.4.241" >> /home/escortcoin6/.escortcoin/escortcoin.conf
sleep 5 
fi
echo "Syncing first node, please wait...";
escortcoind -datadir=/home/escortcoin/.escortcoin -daemon
sleep 10 
until escortcoin-cli -datadir=/home/escortcoin/.escortcoin mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. You 1st masternode is running!"${NC}
sleep 10
echo "Syncing second node, please wait...";
escortcoind -datadir=/home/escortcoin2/.escortcoin -daemon
sleep 10 
until escortcoin-cli -datadir=/home/escortcoin2/.escortcoin mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. You second masternode is running!"${NC}
sleep 10
echo "Syncing third node, please wait...";
escortcoind -datadir=/home/escortcoin3/.escortcoin -daemon
sleep 10 
until escortcoin-cli -datadir=/home/escortcoin3/.escortcoin mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. You third masternode is running!"${NC}
sleep 10
echo "Syncing fourth node, please wait...";
escortcoind -datadir=/home/escortcoin4/.escortcoin -daemon
sleep 10 
until escortcoin-cli -datadir=/home/escortcoin4/.escortcoin mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Fourth node is fully synced. You fourth masternode is running!"${NC}
sleep 10 
echo "Syncing 5th node, please wait...";
escortcoind -datadir=/home/escortcoin5/.escortcoin -daemon
sleep 10 
until escortcoin-cli -datadir=/home/escortcoin5/.escortcoin mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"5th node is fully synced. You 5th masternode is running!"${NC}
sleep 10 
echo "Syncing 6th node, please wait...";
escortcoind -datadir=/home/escortcoin6/.escortcoin -daemon -listen=0
sleep 10 
until escortcoin-cli -datadir=/home/escortcoin6/.escortcoin mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You 6th masternode is running!"${NC}
echo ""
echo -e ${GREEN}"Congrats! Your EAPC Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "The END. You can close now the SSH terminal session";
