class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render file: Rails.root.join('public/404.html') unless current_admin?
  end
end
