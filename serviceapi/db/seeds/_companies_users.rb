User.delete_all
Company.delete_all

users = [
    ["user1","user1","user1@gmail.com",1],
    ["user2","user2","user2@gmail.com",2],
    ["osman","osman","osman@gmail.com",3]
]
companies = [
    ["Company_1","company_1@gmail.com","Amstredam","Nederland"],
    ["Company_2","company_2@gmail.com","Mutnik","BiH"],
    ["Company_3","company_3@gmail.com","Buzim","BiH"]
]

users.each do |username,pass,email,group_id|
  User.create!({username:username,password:pass,email:email,group_id:group_id})
end

companies.each do |name,email,city,country|
  company = Company.create!({name:name,email:email,city:city,country:country})
  user = User.find(rand(1..3))
  company.users << user
end