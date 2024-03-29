class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User registered successfully!"
      redirect_to jobs_path
    else
      flash[:alert] = "Error while creating user: #{user_errors}"
      puts flash[:alert]
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :lastName, :email, :password)
  end

  def user_errors
    @user.errors.full_messages.join(', ')
  end
end
