class Public::PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      redirect_to posts_path, alert: "投稿に失敗しました！"
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post_params
      params.require(:post).permit(:user_id, :body, :image)
  end

end
