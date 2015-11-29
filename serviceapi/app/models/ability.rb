class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)

      if user.permissions?(:admin)
        self.merge Abilities::Admin.new(user)

      elsif user.permissions?(:account_owner)
        self.merge  Abilities::AccountOwner.new(user)

      elsif user.permissions?(:owner)

      elsif user.permissions?(:employee)

      else
          # can :manage, Access
         # raise CanCan::AccessDenied
      end

  end

end
