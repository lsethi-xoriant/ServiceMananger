#This will be executed on initial $vagrant up and all $vagrant provision
echo ======================================
echo This is custome way of installing node
echo -
echo -

apt-get update
#apt-get install -y nodejs
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo npm install -g bower
ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install nodejs-legacy

echo -
echo -
echo End of custome node installing
echo ======================================