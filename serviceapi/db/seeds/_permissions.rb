Permission.delete_all
permissions = [
    ["Create",true,"Create permission"],
    ["Update",true,"udate permision"],
    ["Delete",true,"Delete permission"],
    ["Edit",true,"Edit permision"],
    ["Read",true,"Read permission"]]


permissions.each do |name,active,description|
  Permission.create!({name:name,active:active,description:description})
end