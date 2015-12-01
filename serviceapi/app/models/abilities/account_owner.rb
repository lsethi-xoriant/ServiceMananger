module Abilities
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
      can :logout, :access
    end
  end
end