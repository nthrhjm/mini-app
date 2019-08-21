class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.page(params[:page]).per(8).order("created_at DESC")
    # @posts = Post.where(user_id: current_user.id).order("created_at DESC")
  end

end
