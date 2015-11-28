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
 - SSH to vagrant and run command: sudo apt-get install libpq-dev build-essential
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
  
 
 PostgreSQL:
 DB name: serviceManager
 DB user: service
 DB pass: manager
 
 $ psql service -h 127.0.0.1 -d serviceManager
 
 
 Template:
 
 http://webapplayers.com/homer_admin-v1.7/
 
 https://wrapbootstrap.com/theme/homer-responsive-admin-theme-WB055J451