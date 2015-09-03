#This will be executed on initial $vagrant up and all $vagrant provision
#touch /var/www/serviceapi/initialUp
cp /var/www/puphpet/customConf/serviceapi.conf /etc/nginx/sites-available/serviceapi.conf
service nginx restart
cd /var/www/serviceapi
bundle exec unicorn -c /var/www/puphpet/customConf/unicorn.rb -D
