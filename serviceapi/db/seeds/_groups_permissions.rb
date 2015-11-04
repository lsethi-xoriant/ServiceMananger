Group.delete_all
Permission.delete_all
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


permissionses.each do |name,active,description|
    Permission.create!({name:name,active:active,description:description})
end

all_perrmisions = Permission.all
groups.each do |name,active,description|
    group = Group.create!({name:name,active:active,description:description})
    permission =  all_perrmisions.where(:name => name.downcase).first
    group.permissions << permission
end




