class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipient = User.find_by_id(params[:user])
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:body], "subj").conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversations_path(conversation)
  end
end
