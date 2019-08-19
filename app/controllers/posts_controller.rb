class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
  end

  def new
  end

  def create
    Post.create(post_params)
  end

  private
    def post_params
      params.permit(:name, :title, :body)
    end
end
