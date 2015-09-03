# Minimal sample configuration file for Unicorn (not Rack) when used
# with daemonization (unicorn -D) started in your working directory.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
# See also http://unicorn.bogomips.org/examples/unicorn.conf.rb for
# a more verbose configuration using more features.

working_directory "/var/www/serviceapi"

#listen 2007 # by default Unicorn listens on port 8080
listen "/tmp/unicorn.service.sock"
worker_processes 2 # this should be >= nr_cpus
#pid "/var/www/service/tmp/pids/unicorn.pid"
pid "/home/vagrant/unicorn.pid"
stderr_path "/var/www/serviceapi/log/unicorn.log"
stdout_path "/var/www/serviceapi/log/unicorn.log"
