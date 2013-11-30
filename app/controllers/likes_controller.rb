class LikesController < ApplicationController
  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @likes }
    end
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
    @like = Like.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @like }
    end
  end

  # PUT /likes/1
  # PUT /likes/1.json
  def update
    @like = Like.find(params[:id])
    if current_user.already_likes?(@like.post)
      user_likeship = UserLikeship.find_by_user_id current_user.id, conditions: ['like_id = ?', @like.id]
      user_likeship.destroy
      @like.update_attribute(:count, "#{@like.count - 1}")
    else
      user_likeship = UserLikeship.create( like: @like, user: current_user )
      @like.update_attribute(:count, "#{@like.count + 1}")
    end
    respond_to do |format|
      format.js
      format.html { redirect_to index_url, notice: 'Like was successfully updated.' }
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.html { redirect_to likes_url }
      format.json { head :no_content }
    end
  end
end
