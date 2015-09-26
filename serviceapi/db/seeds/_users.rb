User.delete_all
users = [
    ["user1","user1","user1@gmail.com"],
    ["user2","user2","user2@gmail.com"],
    ["osman","osman","osman@gmail.com"]

]

users.each do |username,pass,email|
  User.create!({username:username,password:pass,email:email})
end