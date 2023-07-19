class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      log_in(user)
      redirect_to jobs_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to jobs_path, notice: "Logged out successfully!"
  end
end
