class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user
      can :change_roles, User, role: 'admin'
      can :unfreeze, User, role: 'admin'
      can :backup, Project
      can :create, Project
      if user.role == 'admin'
        can :manage, Project
      end
      can :manage, Project, user_id: user.id
    end
  end
end
