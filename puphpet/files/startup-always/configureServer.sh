#This  will be executed on every $vagrant up
cd /var/www/serviceapi
bundle exec unicorn -c /var/www/puphpet/customConf/unicorn.rb -D
