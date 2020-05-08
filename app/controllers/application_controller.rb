class ApplicationController < ActionController::Base
  include SessionsHelper
  
  
  
  def count_talks
    @count_talks = room.talks.count
  end
  
  private
  
  
  def require_user_logged_in
    unless logged_in?
      redirect_to build_room_url
    end
  end
end
