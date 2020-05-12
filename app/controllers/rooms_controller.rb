class RoomsController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    before_room_name = room_name_params
    room_name = room_name_params
    if room = Room.find_by(room_name: room_name)#ルーム名を決定する
      n = 1
      while room = Room.find_by(room_name: room_name)
        n += 1
        room_name = room_name_params
        room_name = "#{room_name} (#{n})"
      end
      new_room_name = room_name
    end
    
    @room = Room.new(room_params)
    if new_room_name
      @room.room_name = new_room_name
      if @room.save
        flash[:success] = "すでに同じ部屋名が使用されていたため#{new_room_name}として登録しました。"
        redirect_to enter_room_path
      else
        flash.now[:danger] = '部屋の登録に失敗しました。'
        render :new
      end
    else
      @room.room_name = before_room_name
      if @room.save
        flash[:success] = '部屋を登録しました。'
        redirect_to enter_room_path
      else
        flash.now[:danger] = '部屋の登録に失敗しました。'
        render :new
      end
    end
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @rooms = Room.search(params[:search])
  end
  
  private
  
  def room_params
    params.require(:room).permit(:password, :password_confirmation)
  end
  
  def room_name_params
    hash = params.require(:room).permit(:room_name)
    hash[:room_name]
  end
  
end
