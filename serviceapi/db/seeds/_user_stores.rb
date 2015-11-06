users = User.all
stores = Store.all

users.each_with_index do |user,index|
  if user.groups.pluck(:name).include? 'Employee'
    user.stores << stores[index]
  end
end
