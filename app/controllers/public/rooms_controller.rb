class Public::RoomsController < ApplicationController


  def create
    room = Room.create
    # Roomつくると同時に
    current_entry = Entry.create(user_id: current_user.id, room_id: room.id)
    # ログインユーザーのルームつくる
    #binding.pry
    another_entry = Entry.create(user_id: params[:entry][:user_id], room_id: room.id)
    # (？)
    redirect_to public_room_path(room)
  end


  def index
    current_entries = current_user.entries
    # ログインユーザーのentry全部
    my_room_id = []
                                                                    # （？）
    current_entries.each do |entry|
      # ひとつずつ取り出し
      my_room_id << entry.room.id
      　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　# 代入？
    end
    @another_entries = Entry.where(room_id: my_room_id).where.not(user_id: current_user.id)
    # ログインユーザーのEntryのroom_idかつuser_idがログインユーザーでないもの(?)
  end

  def show
    @room = Room.find(params[:id])
    # binding.pry
    @messages = @room.messages.all
    @message = Message.new
    @entries = @room.entries
    @another_entry = @entries.where.not(user_id: current_user.id).first
  end

end
