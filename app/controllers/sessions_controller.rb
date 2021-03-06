class SessionsController < ApplicationController

  def new
  end

  def create
    @user=User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
  end
end

  def destroy
    session[:user] = nil
    redirect_to users_login_path
  end

end
