class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.post = Post.find(params[:post_id])
    if current_user
      @comment.user = current_user
    end
    respond_to do |format|
      if @comment.save
        format.js #create.js.erb
        format.html { redirect_to posts_url, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render "posts/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      if @comment.user == current_user || @comment.post.user == current_user
        @comment.destroy
        format.js
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      else
        format.js
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end
  end
end
