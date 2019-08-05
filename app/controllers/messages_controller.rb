class MessagesController < ApplicationController

  def create
    @broadcast_list = BroadcastList.find(params[:broadcast_list_id])
    @message = @broadcast_list.messages.create(messages_params)
  end

  private
  def messages_params
    params.require(:message).permit(:txt, :send_at_datetime)
  end

end
