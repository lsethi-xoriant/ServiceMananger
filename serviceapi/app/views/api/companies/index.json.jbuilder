
  json.array! @companies do |company|
    json.id company.id
    json.name company.name
    json.email company.email
    json.city company.city
    json.address company.address
    json.logoImageLink company.logoImageLink

    json.groups do
      json.array! company.groups,:id,:name
    end

    json.users do
      json.array! company.users,:id,:first_name
    end
    json.stores do
      json.array! company.stores,:id,:name
    end
  end
