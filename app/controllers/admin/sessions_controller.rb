class Admin::SessionsController < Admin::BaseController
  def new; end

  def create
    @user = login(params[:session][:name], params[:session][:password])

    debugger
    if @user && @user.admin?
      redirect_to admin_episodes_path, success: '管理者ログインに成功'
    else
      redirect_to root_path
    end
  end
end
