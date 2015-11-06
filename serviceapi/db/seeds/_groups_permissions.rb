
groups = Group.all
perrmisions = Permission.all

groups.each_with_index do |group,index|
 group.permissions << perrmisions[index]
end




