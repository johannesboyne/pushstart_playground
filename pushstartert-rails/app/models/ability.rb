class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user
      can :create, Project
      can :manage, Project, :user_id => user.id
    end
  end
end
