class UsersController < ApplicationController
  before_action :create_categories
  before_action :signin
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:auth] = @user
      redirect_to articles_path
      flash.notice = "User '#{@user.name}' Saved!"
    else
      render :new
      flash.notice = "User '#{@user.name}'Error: Not Saved!"
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
