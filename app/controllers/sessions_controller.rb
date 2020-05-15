class SessionsController < ApplicationController
  def new
  end
  
  def create2
    room_name = params[:room_name]
    password = params[:password]
    if login(room_name, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def create
    room_name = params[:session][:room_name]
    password = params[:session][:password]
    if login(room_name, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end
  
  def direct_enter
    
  end

  def destroy
    session[:room_id] = nil
    flash[:success] = '退室しました。'
    redirect_to root_url
  end
  
  private

  def login(room_name, password)
    @room = Room.find_by(room_name: room_name)
    if @room && @room.authenticate(password)
      # ログイン成功
      session[:room_id] = @room.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
