#This  will be executed on every $vagrant up
echo =========================================
echo Starting unicorn
echo -
echo -

cd /var/www/serviceapi
bundle exec unicorn -c /var/www/puphpet/customConf/unicorn.rb -D

echo -
echo -
echo End of starting unicorn
echo =========================================