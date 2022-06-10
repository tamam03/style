class Public::MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      # binding.pry
      redirect_to public_room_path(message.room)
    else
    end
  end


  private

  def message_params
    params.require(:message).permit(:sentence, :room_id)
  end

end


