json.id @company.id
json.name @company.name
json.email @company.email
json.city @company.city
json.country @company.country
json.address @company.address
json.logoImageLink  @company.logoImageLink

json.users do
  json.array! @company.users,:id,:first_name
end

json.groups do
  json.array! @company.groups,:id,:name
end

json.stores do
  json.array! @company.stores do |store|
    json.id store.id
    json.name store.name
    json.email store.email
    json.city store.city
    json.country store.country
    json.logoImageLink store.logoImageLink
    json.address store.address

    json.users store.users do |user|
      json.id user.id
      json.first_name user.first_name
    end

    json.groups store.groups do |group|
      json.name group.name
      json.id group.id
      end

    json.groups store.groups do |group|
      json.name group.name
      json.id group.id
    end


  end
end
