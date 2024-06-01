class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create!(user_params)
    redirect_to user
  end

  def show
    @user = User.find(params[:id])
    head :forbidden if !logged_in? or @user.id != current_user.id
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
