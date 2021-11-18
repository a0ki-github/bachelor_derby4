class Admin::SessionsController < Admin::BaseController
  skip_before_action :require_admin

  def new; end

  def create
    @user = login(params[:session][:name], params[:session][:password])

    if @user && @user.admin?
      session[:admin_user_id] = @user.id
      redirect_to admin_episodes_path, success: '管理者ログインに成功'
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_path
  end
end
