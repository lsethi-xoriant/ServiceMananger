class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.permissions?(:admin)
        Abilities::Admin.new(user)

      elsif user.permissions?(:account_owner)
        Abilities::AccountOwner.new(user)

      elsif user.permissions?(:owner)
        can :manage,Company,:user_id => user.id

      elsif user.permissions?(:employee)

      else
          # can :manage, Access
         # raise CanCan::AccessDenied
      end

  end
  
end
