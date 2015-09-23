#This will be executed on initial $vagrant up and all $vagrant provision
#touch /var/www/serviceapi/initialUp
echo ========================================================================
echo Copying nginx serviceapi config file, restarting nginx and start unicorn
echo -
echo -

cp /var/www/puphpet/customConf/serviceapi.conf /etc/nginx/sites-available/serviceapi.conf
service nginx restart
cd /var/www/serviceapi
bundle exec unicorn -c /var/www/puphpet/customConf/unicorn.rb -D

echo -
echo -
echo End of copying nginx serviceapi config file, restarting nginx and start unicorn
echo ========================================================================