json.user do
  json.auth_token @user.auth_token
  json.partial! 'api/users/user',collections:@user
end