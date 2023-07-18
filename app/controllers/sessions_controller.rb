class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      log_in(user)
      redirect_to jobs_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to jobs_path, notice: "Logged out successfully!"
  end
end
