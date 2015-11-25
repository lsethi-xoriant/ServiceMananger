
groups = Group.all.limit(2)
perrmision = Permission.find(2)

groups.each_with_index do |group,index|
 group.permissions << perrmision
end




