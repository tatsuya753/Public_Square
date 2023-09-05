class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path
  end

end
