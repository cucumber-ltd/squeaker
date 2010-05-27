class UsersController < ApplicationController
  def follow
    logged_in_user = User.find_by_id session[:logged_in_user_id]
    user_to_follow = User.find_by_id params[:user_id]
    
    logged_in_user.followed_users << user_to_follow
    logged_in_user.save
    redirect_to :controller => :messages, :action => :index
  end

  def show
    @user = User.find_by_username(params[:id])
  end
end
