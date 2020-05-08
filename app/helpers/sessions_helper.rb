module SessionsHelper
  def current_room
    @current_room ||= Room.find_by(id: session[:room_id])
  end
  
  def refusal?
    user = User.find_by(id: session[:id])
    user.ban_number < 10
  end
  
  def logged_in?
    !!current_room
  end
  
  def room_params
    params.permit(:room_name)
  end
end
