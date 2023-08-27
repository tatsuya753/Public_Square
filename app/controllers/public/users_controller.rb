class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  # フォロー一覧
  def follows
  user = User.find(params[:id])
  @users = user.following_users
  end

  # フォロワー一覧
  def followers
    user = User.find(params[:id])
    @user = user.follower_users
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile_image )
  end

end
