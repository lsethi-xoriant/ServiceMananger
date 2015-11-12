groups = Group.all
users = User.all
users.each_with_index do |user,index|

  if !user.companies.empty?
  #   user.groups << groups.where(:name => 'Employee')
  # else
    user.groups << groups.where(:name => "Account_Owner")
  end

end