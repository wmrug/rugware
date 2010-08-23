class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.all
  end
  
  def make_admin
    @user.admin = params[:user][:admin]
    @user.save
    redirect_to @user
  end
  
  def profile
    redirect_to "/" unless current_user
    @user = current_user
    render :action => "show"
  end
  
end
