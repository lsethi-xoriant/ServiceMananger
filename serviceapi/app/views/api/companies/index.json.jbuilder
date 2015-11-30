
  json.array! @companies do |company|
    json.id company.id
    json.name company.name
    json.email company.email

    json.groups do
      json.array! company.groups,:id,:name
    end

    json.users do
      json.array! company.users,:id,:username
    end
    json.stores do
      json.array! company.stores,:id,:name
    end
  end
