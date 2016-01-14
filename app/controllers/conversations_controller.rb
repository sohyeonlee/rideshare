class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @unread_messages = @mailbox.inbox(unread: true).count
    @status = "msg"
  end

  def show
    @status = "msg"
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(current_user)
    redirect_to conversations_path
  end

private
  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end
