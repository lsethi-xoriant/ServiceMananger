 A README.md file is intended to quickly orient readers to what your project can do.
 [Learn more](http://go.microsoft.com/fwlink/p/?LinkId=524306) about Markdown.
 
 Application name: Managerno
 
 This project has staging environment created for Vagrant and VirtualBox.
 
 Dependency:
 - Vagrant 1.7.4
 - VirtualBox 5.0.3
 
 
 First start:
 - Create folder (important): D:\Mega\LoyaltyStudio\ServiceManager
 - Clone repository to this folder
 - Open console and navigate to this folder
 - Run "vagrant up"
 - Run "vagrant provision"
 - SSH to vagrant and run command: sudo apt-get install libpq-dev build-essential -y
 - Go to /etc/postgresql/9.3/main and open pg_hba.conf with command: sudo nano pg_hba.conf
 - Change line ( local   all     all             ident ) to ( local   all     all             md5 )
 - Reload vagrant: vagrant reload (exit from ssh first)
 
 
 Installing Rails app
 - If there is no rails app already created we should create one in serviceapi folder 
 - SSH to vagrant with command: vagrant ssh
 - Navigate to /var/www
 - Run command: rails new serviceapi [optional config]
 - Ucomment unicorn gem in Gemfile
 - Navigate to /var/www/serviceapi
 - Run command: bundle install
 - Reload vagrant: vagrant reload (exit from ssh first)
 
 
 Initial Rails Commands
 - rake db:migrate
 - rake db:seed
 
  
 
 PostgreSQL:
 DB name: serviceManager
 DB user: service
 DB pass: manager
 
 $ psql service -h 127.0.0.1 -d serviceManager
 
 
 
 Configure host file
 
 Amazon
 - 52.19.28.47 service.web
 - 52.19.28.47 admin.service.web
 - 52.19.28.47 api.service.web
  
 Vagrant Local
 - 192.168.30.101 service.dev
 - 192.168.30.101 serviceadmin.dev
 - 192.168.30.101 serviceapi.dev
 
 
 Note: After geting new ubuntu vagrant box files in D:\Mega\LoyaltyStudio\ServiceManager\puphpet\files\exec-always foler didn't run correctly. Run it manual.
 
 
 Template:
 
 http://webapplayers.com/homer_admin-v1.7/
 
 https://wrapbootstrap.com/theme/homer-responsive-admin-theme-WB055J451