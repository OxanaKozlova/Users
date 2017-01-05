class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to @post
    else render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to @post
    else  render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post was successfully destroyed.'
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image, :content, :user)
  end

end
