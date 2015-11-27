json.id @group.id
json.name @group.name

json.users do
  json.array! @group.users,:id,:username
end

json.permissions do
  json.array! @group.permissions,:id,:name
end

json.stores do
  json.array! @group.stores,:id,:name
end