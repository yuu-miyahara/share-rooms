module SessionsHelper
  def current_room
    @current_room ||= Room.find_by(id: session[:room_id])
  end

  def logged_in?
    !!current_room
  end
end
