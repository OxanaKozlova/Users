class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role?(User::ADMIN_ROLE)
      admin
    elsif user.role?(User::MODERATOR_ROLE)
      moderator
    else
      can :read, User
      can :read, Post
      can :manage, Post, user_id: user.id
    end
  end

  def moderator
    can :read, User
    can [:read, :manage], Post
  end

  def admin
    moderator
    can :manage, :all
  end
end
