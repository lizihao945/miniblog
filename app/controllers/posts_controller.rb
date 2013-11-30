class PostsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  def authenticate
    if current_user.nil?
      redirect_to index_path, :notice => 'What\'re you doing!? Please Log In To Add/Modify Your Own Post!'
    end
  end
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    if not current_user and flash[:notice].nil?
      flash[:notice] = 'You Can Now View the Posts of Others.'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @like = Like.new
    @like.post = @post
    @post.like = @like
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    if current_user != @post.user
      redirect_to index_url, notice: 'Edit your own!'
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to index_url, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.user = current_user
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    respond_to do |format|
      if current_user == @post.user
        @post.destroy
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      else
        format.html { redirect_to posts_url, notice: 'You can only destroy your own posts!' }
        format.json { head :no_content }
      end
    end
  end
end
