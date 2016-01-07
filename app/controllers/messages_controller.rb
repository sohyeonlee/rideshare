class MessagesController < ApplicationController
  def new
  end

  def create
    message_to = User.where(id: params['recipients'])
    message = current_user.send_message(message_to, params[:message][:body], "").conversation
    redirect_to conversation_path(message)
  end
end
