Group.delete_all
Permission.delete_all
User.delete_all
Company.delete_all

companies =[
    ["Company_1","company_1@gmail.com","Amsterdam","Nederland"],
    ["Company_2","company_2@gmail.com","Mutnik","BiH"],
    ["Company_3","company_3@gmail.com","Buzim","BiH"],
    ["Company_4","company_4@gmail.com","Buzim","BiH"]
]

permissionses = [
    ["admin",true,"Admin  permission"],
    ["account owner",true,"Account owner  permission"],
    ["owner",true,"Owner  permission"],
    ["employee",true,"Employee  permission"]
]
groups = [
    ["Admin",true,"Admin can do ...... and do...... "],
    ["Account Owner",true,"Account owner can do ...... and do...... "],
    ["Owner",true,"Saller can do ...... and do...... "],
    ["Employee",true,"Employe can do ...... and do...... "]

]
stores = [
    ["store1","store1@gmail.com","London","UK"],
    ["store2","store2@gmail.com","Mutnik","Bosnia"],
    ["store3","store3@gmail.com","Buzim","Bosnia"],
    ["store4","store4@gmail.com","Bec","Austria"]
]

users = [
    ["user1","user1","user1@gmail.com"],
    ["user2","user2","user2@gmail.com"],
    ["osman","osman","osman@gmail.com"],
    ["ado pado","ado","ado_pado@gmail.com"]
]
users.each do |username,pass,email|
  User.create!({username:username,password:pass,email:email})
end

companies.each do |name,email,city,country|
  Company.create!({name:name,email:email,city:city,country:country})
end

permissionses.each do |name,active,description|
  Permission.create!({name:name,active:active,description:description})
end
groups.each do |name,active,description|
  Group.create!({name:name,active:active,description:description})
  end
stores.each do |name,email,city,country|
  Store.create!({name:name,email:email,city:city,country:country,company_id:rand(1..4)})
end





Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }