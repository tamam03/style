class Public::ChatsController < ApplicationController
  
  def create
  end
  
  
  
  
  
  
  
  
  def show
    binding.irb
    @chat = Chat.find(params[:id])
    # チャット相手みつける
    user_room = UserRoom.where(room_id: @chat.room).where.not(user_id: current_user).first.user
    # 自分のチャット部屋全てを取得
    rooms = current_user.user_rooms.pluck(:room_id)
    # 取得した部屋の中から見つけた相手の部屋と自分の部屋同じ部屋があるか中間テーブルでさがす
    user_room = UserRoom.find_by(user_id: @user.id, room_id: rooms)
    # ないとき
    if user_room.nil?
      # あたらしく部屋つくる
      @room = Room.new
      @room.save
      # 新しく作ったへやを中間テーブルの中で相手と自分のふたりぶんつくる
      # 相手のぶん
      UserRoom.create(user_id: @user.id, room_id: @room.id)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      # あるとき# 探してきてみつけたへやを代入
      @room = user_room.room
    end
      # これまでのチャットの内容
      @chats = @room.chats
      # あたらしくチャットのため空，どこの部屋のチャット内容か渡す
      @chat = Chat.new(room_id: @room.id)
  end

  def create
    # すとぱらからおくられてきた内容をもとにチャット内容つくる
    @chat = Chat.new(chat_params)
    respond_to do |format|
      if @chat.save
        format.html { redirect_to public_chat_path(@chat) }
        format.js
      else
        format.html { render :show }
        format.js { render :errors }
      end
    end
  end



  private

  def chat_params
    params.require(:chat).permit(:sentence, :room_id).merge(user_id: current_user.id)
  end
end
