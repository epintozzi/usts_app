class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user
      can [:new, :create], [RaceRegistration, UstsRegistration]
      can [:show], RaceRegistration
    end
    if user.editor? || user.admin?
      can [:new, :create, :edit, :update], News
    end
    if user.admin?
      can [:index, :show], UstsRegistration
      can [:new, :create, :edit, :update], Race
    end

  end
end
