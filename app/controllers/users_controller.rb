class UsersController < ApplicationController
  before_filter :authenticate_user!

  def rides
    @status = "ride"
  end

  def dashboard
  end

  def index
    @user = current_user
    @status = "profile"
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      sign_in @user, :bypass => true
      redirect_to users_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
