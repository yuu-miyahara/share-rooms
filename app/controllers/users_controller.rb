class UsersController < ApplicationController
  include ToppagesHelper
  def update
    identify_user
    @user.update(user_params)
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name)
  end
  
end
