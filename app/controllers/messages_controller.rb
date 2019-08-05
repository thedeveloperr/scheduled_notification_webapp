class MessagesController < ApplicationController

  def create
    @broadcast_list = BroadcastList.find(params[:broadcast_list_id])
    @message = @broadcast_list.messages.create(messages_params)
    p @message.send_at.to_time
    SendSmsToBroadcastListJob
        .set(wait_until: @message.send_at.to_time)
      .perform_later(@message.id)
    render 'successful'
  end

  private
  def messages_params
    params.require(:message).permit(:txt, :send_at_datetime, :time_zone)
  end

end
