class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role?(User::ADMIN_ROLE)
      admin
    elsif user.role?(User::MODERATOR_ROLE)
      moderator
    else
      can :read,  User
    end
  end

  def moderator
    can :read, User
  end

  def admin
    moderator
    can :manage, :all
  end
end
