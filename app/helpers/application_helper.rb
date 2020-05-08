module ApplicationHelper
include ToppagesHelper

  def user_name
      @user=identify_user
      name = @user.name
  end
end
