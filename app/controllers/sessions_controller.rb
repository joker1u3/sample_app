class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      #登入用户，然后重定向到用户的资料页面
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        flash[:success] = "Welcome to the Sample APP! #{@user.name}！"
        redirect_back_or(@user)
      else
        message = "Account not activated. "
        message += "Check you email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else 
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
