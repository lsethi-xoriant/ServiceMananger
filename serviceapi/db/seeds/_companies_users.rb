

companies = Company.all.limit(2)
users = User.all.limit(2)
#
# companies.each_with_index do |company,index|
#   users[index].companies << company
# end

users.each_with_index do |user,index|
  user.companies << companies[index]
end

