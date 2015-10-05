User.delete_all
users = [
    ["user1","user1","user1@gmail.com",1],
    ["user2","user2","user2@gmail.com",2],
    ["osman","osman","osman@gmail.com",3]

]

users.each do |username,pass,email,group_id|
  User.create!({username:username,password:pass,email:email,group_id:group_id})
end