require_relative '../services/SMSService.rb'

class CreateBroadcastListJob < ApplicationJob
  queue_as :default

  def perform(list_id)
    broadcast_list = BroadcastList.find(list_id)
    phone_nums = broadcast_list.recipients_phone_numbers
    display_name = broadcast_list.event_code[0...10]
    SMSService.instance.create_broadcast_list(
      phone_nums,
      broadcast_list.id.to_s,
      display_name
    )
  end
end
