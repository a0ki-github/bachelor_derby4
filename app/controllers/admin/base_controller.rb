class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    redirect_to admin_login_path unless User.find_by(id: session[:admin_user_id])&.admin?
  end
end
