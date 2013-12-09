class OwnPostController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  def authenticate
    if current_user.nil?
      redirect_to index_path, :notice => 'What\'re you doing!? Please Log In To Add/Modify Your Own Post!'
    end
  end
  def index
  	@posts = Post.find(:all, conditions: {user_id: params[:user_id]})
	respond_to do |format|
  	  format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
end
