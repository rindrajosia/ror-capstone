class SessionsController < ApplicationController
  before_action :signin, except: [:destroy]
  def login
    @user = User.new
  end

  def check
    @current_user = User.where(name: user_params[:name]).first
    if @current_user
      session[:auth] = @current_user.id
      redirect_to articles_path
    else
      flash.notice = 'Identifiant incorrect'
      redirect_to new_session_path
    end
  end

  def destroy
    session.destroy
    redirect_to new_session_path, success: 'You are deconnected'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
