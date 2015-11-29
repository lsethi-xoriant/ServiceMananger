json.user do
  json.auth_token @user.auth_token
  json.partial! @user,collections: @user
end
