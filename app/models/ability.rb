class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :profile, :to => :read
    alias_action :make_admin, :to => :promote
    
    if user.try(:admin?)
      can :manage, :all
    else
      can :read, :all
      can :update, User do |another_user|
        another_user == user
      end
    end
  end
end