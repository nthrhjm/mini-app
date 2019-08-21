class PostsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    # @user = current_user
    @post = Post.new
  end

  def create
    Post.create(title: post_params[:title],body: post_params[:body], user_id: current_user.id )
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
