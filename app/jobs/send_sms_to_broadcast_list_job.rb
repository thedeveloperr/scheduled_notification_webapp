require_relative '../services/SMSService.rb'

class SendSmsToBroadcastListJob < ApplicationJob
  queue_as :default

  def perform(msg_id)
    # Do something later
    message = Message.find(msg_id)
    broadcast_list = message.broadcast_list
    SMSService.instance.broadcast_msg(message.txt, broadcast_list.id.to_s)
  end
end
