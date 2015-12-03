json.id @company.id
json.name @company.name
json.email @company.email
json.city @company.city
json.country @company.country
json.image_url @company.image_url

json.users do
  json.array! @company.users,:id,:first_name
end

json.groups do
  json.array! @company.groups,:id,:name
end

json.stores do
  json.array! @company.stores,:id,:name
end