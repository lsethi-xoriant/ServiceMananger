# users = User.all
# stores = Store.all
#
# users.each_with_index do |user,index|
#   # if user.groups.pluck(:name).include? 'Employee'
#   #   user.stores = stores[index]
#   #   user.companies = Company.where(:id => stores[index].company_id)
#   #   user.save
#   # end
#
#   if user.groups.pluck(:name).include? 'Account_Owner'
#       user.stores << Store.where(:company_id => user.companies.pluck(:id))
#   end
#
#
# end
