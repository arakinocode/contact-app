class MessagesController < ApplicationController
  before_action :set_params, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @messages = Message.all
    @message = Message.new
    @messages = @room.messages.includes(:user).order("created_at DESC")
    @user = User.all
    @room_a = Room.find_by(id:1)
    @room_a = @room_a.name
    @room_b = Room.find_by(id:2)
    @room_b = @room_b.name
    @room_c = Room.find_by(id:3)
    @room_c = @room_c.name
    @room_d = Room.find_by(id:4)
    @room_d = @room_d.name
  end

  def create
    @message = @room.messages.new(message_params)
    @user = User.find_by(id: current_user.id)
    if @message.save
      ActionCable.server.broadcast "message_channel", content: @message , user: @user
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_params
    @room = Room.find(params[:room_id])
  end
end
