class TalksController < ApplicationController
  def create
    @talk = current_room.talks.build(talk_params)
    @talk.user_id = session[:id]
    if @talk.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @talks = current_room.talks.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  private
  
  def talk_params
    params.require(:talk).permit(:content, :user)
  end
end
