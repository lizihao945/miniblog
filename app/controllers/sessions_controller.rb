class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.authenticate(params[:email], params[:passwd])
    if user
      session[:user_id] = user.id
      redirect_to posts_url, :notice => "Logged in successfully!"
    else
      redirect_to login_url, :notice => "Invalid email or password!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_url
  end
end
