class Public::UsersController < ApplicationController

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile_image )
  end

end
