class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
