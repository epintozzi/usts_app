class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.normal?

    elsif user.editor?

    elsif user.admin?

    end

  end
end
