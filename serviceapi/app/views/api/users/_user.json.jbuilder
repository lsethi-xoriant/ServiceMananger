  json.id  @user.id
  json.username  @user.username
  json.email  @user.email
  json.account_package_id  @user.account_package_id
  json.language @user.language
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.image_url @user.image_url

  json.groups do
    json.array! @user.groups,:id,:name unless @user.groups.empty?
  end

  json.permissions do
    json.array! @user.permissions,:id,:name unless @user.permissions.empty?
  end
  json.companies do
    json.array! @user.companies,:id,:name unless @user.companies.empty?
  end
  json.stores do
    json.array! @user.stores,:id,:name unless @user.stores.empty?
  end
