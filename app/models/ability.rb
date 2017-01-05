class Ability
  include CanCan::Ability

  def initialize(current_user)
    current_user ||= User.new
    if current_user.role?(User::ADMIN_ROLE)
      admin
    elsif current_user.role?(User::MODERATOR_ROLE)
      moderator
    else
      user(current_user)
    end
  end

  def moderator
    can :read, User
    can [:read, :manage], Post
  end

  def admin
    can :manage, :all
  end

  def user(current_user)
    can :read, User
    can :read, Post
    can :manage, Post, user_id: current_user.id
  end

end
