class RoomsController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(string_params)

    if @room.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to enter_room_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @rooms = Room.search(params[:search])
  end
  
  private
  
  def string_params
    params.require(:room).permit(:room_name, :password, :password_confirmation)
  end
end
