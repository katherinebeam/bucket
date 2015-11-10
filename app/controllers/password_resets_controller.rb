class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      Notifier.password_reset(user).deliver
      flash[:success] = "Check your email! We've sent a link to reset your password."
      redirect_to login_path
    else
      flash.now[:notice] = "Email not found."
      render action: 'new'
    end
  end

  def edit
  end
  
  def update
    user = User.find_by(email: params[:email])
    user.generate_password_reset_token!
    flash[:success] = "Check your email! We've sent a link to reset your password."
    redirect_to login_path
  end
end