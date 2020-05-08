class ToppagesController < ApplicationController
  def index
      
    unless session[:id]
      while session[:id].blank? || User.find_by(id: session[:id]).present? do
        # ランダムな20文字をidに設定し、whileの条件検証に戻る
        session[:id] = SecureRandom.alphanumeric(12)
      end
      @user = User.create(id: session[:id], name: "匿名", ban_number: 0)
    end
    
    if logged_in?
      room = current_room.id
      user = session[:id]
      @talk = Talk.new(user_id: user, room_id: room, content: nil)
      # form_with 用
      @talks = current_room.talks.order(created_at: :desc).page(params[:page]).per(100)
    end
    
    
  end
  
end
