#This will be executed on initial $vagrant up and all $vagrant provision
echo ======================================
echo This is custome way of installing node
echo -
echo -

apt-get update
apt-get install -y node

echo -
echo -
echo End of custome node installing
echo ======================================