class Admin::UsersController < ApplicationController

  def index
    @users = User.order(created_at: :desc)
    # @users = Kaminari.paginate_array(@users).page(params[:page])
  end

  def show
     @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザーを削除しました！"
  end

end
