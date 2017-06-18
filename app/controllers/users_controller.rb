class UsersController<ApplicationController


  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to users_signup_path
    end
  end

  def show
    @user=current_user
  end



  private

  def current_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
