class BansController < ApplicationController
include BansHelper

  def create
    user = User.find(params[:banner_id])
    current_user.ban(user)
    user.ban_number += 1
    flash[:danger] = "ユーザを報告しました。"
    redirect_to root_url
  end

  def destroy
    user = User.find(params[:banner_id])
    current_user.reset(user)
    user.ban_number -= 1
    flash[:saccess] = "報告を解除しました。"
    redirect_to root_url
  end
end
