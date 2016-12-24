class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role?('admin')
      admin
    elsif user.role?('manager')
      manager
    else
      can :read,  User
    end
  end

  def manager
    can :read, User
  end

  def admin
    manager
    can :manage, :all
  end
end
