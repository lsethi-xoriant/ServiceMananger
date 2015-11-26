module Abilities
  def self.ability_for(user)
    if user.permissions?(:admin)
     Admin.new(user)
    elseif user.permissions?(:account_owner)
    AccountOwner.new(user)
    else
    GuestAbility.new
    end
  end

  class AccountOwner
    include CanCan::Ability

    def initialize(user)
      can :manage,Company,users:{id: user.id}
      can :create,Company
      can :manage,Store,id: user.stores.pluck(:id)
      can :create,Store,company_id: user.companies.pluck(:id)
      can :manage,Group,stores:{id: user.stores.pluck(:id)}
      can :create,Group
      can :read,Permission
      can :manage,User,companies:{id:user.companies.pluck(:id)}
      can :create,User
    end
  end
end