Group.delete_all
Permission.delete_all
User.delete_all
Company.delete_all

account_package = [
    ["Basic","Basic account packege"],
    ["Medium","Medium account packege"],
    ["Premium","Premium account packege"],
]

companies =[
    ["Company_1","company_1@gmail.com","Amsterdam","Nederland"," De Ruijterkade 7. 1013 AA"],
    ["Company_2","company_2@gmail.com","Mutnik","BiH","Ibrahim Perviz"]
    # ["Company_3","company_3@gmail.com","Buzim","BiH"],
    # ["Company_4","company_4@gmail.com","Buzim","BiH"]
]

permissionses = [
    ["admin",true,"Admin  permission"],
    ["account_owner",true,"Account owner  permission"]
    # ["owner",true,"Owner  permission"],
    # ["employee",true,"Employee  permission"]
]
groups = [
    ["Admin",true,"Admin can do ...... and do...... "],
    ["Account_Owner",true,"Account owner can do ...... and do...... "]
    # ["Company_1 store Employee ",true,"Default Employee Group for Company_1 store"],
    # ["Company_2 store Employee ",true,"Default Employee Group for Company_2 store"]
]
stores = [
    ["company_1 store","store1@gmail.com","London","UK",1,"Houghton Street"],
    [" company_2store","store2@gmail.com","Mutnik","Bosnia",2,"Ibrahim Perviz "]
]

users = [
    ["user1","user1","user1@gmail.com",1,1,"en"],
    ["user2","user2","user2@gmail.com",2,2,"bs"]
    # ["osman","osman","osman@gmail.com"],
    # ["ado pado","ado","ado_pado@gmail.com"]
]


companies.each do |name,email,city,country,address|
  Company.create!({name:name,email:email,city:city,country:country,address:address})
end

permissionses.each do |name,active,description|
  Permission.create!({name:name,active:active,description:description})
end
groups.each do |name,active,description|
  Group.create!({name:name,active:active,description:description})
end
stores.each do |name,email,city,country,company_id,address,logoImageLink|
  Store.create!({name:name,email:email,city:city,country:country,company_id:company_id,address:address,logoImageLink:logoImageLink})
end
account_package.each do |name,description|
    AccountPackage.create!({name:name,description:description})
end
users.each do |first_name,pass,email,account_package_id,company_id,language|
    User.create!({first_name:first_name,password:pass,email:email,account_package_id:account_package_id,company_ids:[company_id],language:language})
end



Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }