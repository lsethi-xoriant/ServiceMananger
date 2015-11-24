#This will be executed on initial $vagrant up and all $vagrant provision
echo ======================================
echo This is custome way of installing node, npm, bower, grunt
echo -
echo -

apt-get update
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo npm install -g bower
ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install nodejs-legacy
sudo npm install -g grunt-cli

echo -
echo -
echo This is end of custome way of installing node, npm, bower, grunt
echo ======================================