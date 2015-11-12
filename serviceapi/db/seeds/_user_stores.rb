users = User.all
stores = Store.all

users.each_with_index do |user,index|
  # if user.groups.pluck(:name).include? 'Employee'
  #   user.stores << stores[index]
  # end

  if user.groups.pluck(:name).include? 'Account_Owner'
      user.stores << Store.where(:company_id => user.companies.pluck(:id))
  end


end
