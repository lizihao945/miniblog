class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.authenticate(params[:email], params[:passwd])
    if user
      session[:user_id] = user.id
    end
    respond_to do |format|
      if user
        format.js
        format.html { redirect_to index_url, :notice => "Logged in successfully!" }
      else
        format.js
        format.html { redirect_to login_url, :notice => "Invalid email or password!" }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_url
  end
end
