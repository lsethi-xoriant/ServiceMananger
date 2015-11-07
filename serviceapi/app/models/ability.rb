class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.permissions?(:admin)
        can :manage, :all
      elsif user.permissions?(:account_owner)
        can :manage,Company,users:{id: user.id}
      elsif user.permissions?(:owner)
        can :manage,Company,:user_id => user.id
      elsif user.permissions?(:employee)

      else
          can :manage, Access
         # raise CanCan::AccessDenied
      end

  end
end
