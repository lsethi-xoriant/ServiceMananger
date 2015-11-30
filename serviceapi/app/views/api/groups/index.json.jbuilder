
  json.array! @groups do |group|
    json.id group.id
    json.name group.name

    json.permissions do
      json.array! group.permissions,:id,:name
    end
    json.users do
      json.array! group.users,:id,:name
    end
    json.stores do
      json.array! group.stores,:id,:name
    end
  end
