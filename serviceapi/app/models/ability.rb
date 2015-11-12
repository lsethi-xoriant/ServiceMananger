class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.permissions?(:admin)
        can :manage, :all
      elsif user.permissions?(:account_owner)
        can :manage,Company,users:{id: user.id}
        can :create,Company
        can :manage,Store,id: user.stores.pluck(:id)
        can :create,Store,company_id: user.companies.pluck(:id)
        can :manage,Group,stores:{id: user.stores.pluck(:id)}
        can :create,Group do |group|
          checking_ids(user.stores.pluck(:id),group.store_ids)
        end




      elsif user.permissions?(:owner)
        can :manage,Company,:user_id => user.id
      elsif user.permissions?(:employee)

      else
          can :manage, Access
         # raise CanCan::AccessDenied
      end

  end

  def checking_ids(arrBase,arrParam)
    isExist=false
    arrParam.each do |v|
      isExist=false
      arrBase.each do |base|
        if v == base
          isExist = true
          break
        end
      end
      if !isExist
        raise CanCan::AccessDenied.new("One of the Stores is not yours")
      end
    end
    return isExist
  end
end
