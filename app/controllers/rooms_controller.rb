class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy]

  def index
    @room = Room.all
    @room_a = Room.find_by(id: 1)
    @room_a = @room_a.name
    @room_b = Room.find_by(id: 2)
    @room_b = @room_b.name
    @room_c = Room.find_by(id: 3)
    @room_c = @room_c.name
    @room_d = Room.find_by(id: 4)
    @room_d = @room_d.name
  end

  def new
    @room = Room.new
  end

  # def create
  #   @room = Room.new(room_params)
  #   if @room.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    if @room = Room.find(params[:id])
      @room.update(room_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # def destroy
  #     room = Room.find(params[:id])
  #     room.destroy
  #     redirect_to root_path
  # end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
