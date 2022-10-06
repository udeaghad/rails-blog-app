class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all

    if user.role == 'admin'
      can :manage, :all

    else
      can :update, Post do |post|
        post.user == user
      end

      can :destroy, Post do |post|
        post.user == user
      end

      can :update, Comment do |comment|
        comment.user == user
      end

      can :destroy, Comment do |comment|
        comment.user == user
      end

      can :create, Post
      can :create, Comment
      can :create, Like
      can :read, :all
    end
  end
end
