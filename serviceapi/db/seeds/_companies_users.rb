User.delete_all
Company.delete_all

users = [
    ["user1","user1","user1@gmail.com"],
    ["user2","user2","user2@gmail.com"],
    ["osman","osman","osman@gmail.com"],
    ["ado pado","ado","ado_pado@gmail.com"]
]
companies =[
    ["Company_1","company_1@gmail.com","Amsterdam","Nederland"],
    ["Company_2","company_2@gmail.com","Mutnik","BiH"],
    ["Company_3","company_3@gmail.com","Buzim","BiH"],
    ["Company_4","company_4@gmail.com","Buzim","BiH"]
]

users.each do |username,pass,email|
  User.create!({username:username,password:pass,email:email})
end

companies.each do |name,email,city,country|
  company = Company.create!({name:name,email:email,city:city,country:country})
  user = User.find(rand(1..3))
  company.users << user
end