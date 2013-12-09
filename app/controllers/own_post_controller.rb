class OwnPostController < ApplicationController
	def index
		@posts = Post.find(:all, conditions: {user_id: params[:user_id]})
		respond_to do |format|
      	  format.html # index.html.erb
          format.json { render json: @posts }
        end
	end
end
