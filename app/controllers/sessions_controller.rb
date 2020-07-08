class SessionsController < ApplicationController
  def login
    @user = User.new
  end

  def check
    @current_user = User.where(name: user_params[:name]).first
    if @current_user
      session[:auth] = @current_user
      redirect_to new_user_path
    else
      flash.notice = 'Identifiant incorrect'
      render 'login'
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
