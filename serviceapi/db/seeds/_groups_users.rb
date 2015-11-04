users = User.all
groups = Group.all


groups.each_with_index do |group,index|
  users[index].groups << group
end