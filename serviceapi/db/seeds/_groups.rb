Group.delete_all
groups = [
    ["seller",true,"Saller can do ...... and do...... "],
    ["servicer",true,"Servicer can do ...... and do...... "],
    ["employee",true,"Employe can do ...... and do...... "]

]

groups.each do |name,active,description|
  Group.create!({name:name,active:active,description:description})
end