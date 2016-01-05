json.id @store.id
json.name @store.name
json.email @store.email
json.city @store.city
json.country @store.country
json.address @store.address
json.logoImageLink @store.logoImageLink
json.company @store.company,:id,:name

json.users do
  json.array! @store.users,:id,:first_name
end

json.groups do
  json.array! @store.groups,:id,:name
end
