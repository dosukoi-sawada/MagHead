class UsersController < ApplicationController
  def new
  end

  def create
    logger.debug "user_params: #{user_params}"
    user = User.create!(user_params)
    if user.save
      redirect_to user
    else
      render :new
    end
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
