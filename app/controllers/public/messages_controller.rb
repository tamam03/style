class Public::MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      redirect_to public_room_path(message.room_id)
    else
      redirect_to public_room_path(message.room_id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:sentence, :room_id, :message_image)
  end
end
