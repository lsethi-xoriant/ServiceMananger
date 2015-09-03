 A README.md file is intended to quickly orient readers to what your project can do.
 [Learn more](http://go.microsoft.com/fwlink/p/?LinkId=524306) about Markdown.
 
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
 - If there is no rails app already created we should create one in serviceapi folder (ssh to vagrant with command "vagrant ssh", navigate to /var/www and run "rails new serviceapi [optional config]"
 - Ucomment unicorn gem in Gemfile, navigate to /var/www/serviceapi and run "bundle install" 
 - Reload vagrant "vagrant reload" (exit from ssh first)
 
 