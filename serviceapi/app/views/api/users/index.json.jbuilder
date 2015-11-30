json.users do
  json.array! @users do |user|
    json.id user.id
    json.username user.username
    json.email user.email
    json.language @user.language
    json.groups do
      json.array! user.groups,:id,:name
    end
    json.permissions do
      json.array! user.permissions,:id,:name
    end
    json.companies do
      json.array! user.companies,:id,:name
    end
    json.stores do
      json.array! user.stores,:id,:name
    end
  end
end