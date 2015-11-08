class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You've been logged in successfully!"
      redirect_to bucket_lists_path
    else
      flash[:error] = "There was a problem with logging into your account. Please try again."
      render action: 'new'
    end
  end
end
