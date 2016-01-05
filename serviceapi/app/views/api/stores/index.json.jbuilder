
  json.array! @stores do |store|
    json.id store.id
    json.name store.name
    json.email store.email
    json.city store.city
    json.address store.address
    json.country store.country
    json.company store.company,:id,:name

    json.users do
      json.array! store.users,:id,:first_name
    end
    json.groups do
      json.array! store.groups,:id,:name
    end
  end
