require_relative './AWSSMSService.rb'
require 'singleton'

class SMSService
  include Singleton
  def get(type)
    case type
    when 'AWS_SNS'
      AWSSMSService.instance
    else
      raise 'Unsupported type of SMS service provider'
    end
  end

  def initialize
    @default = get ENV['SMS_SERVICE_PROVIDER']
  end

  def create_broadcast_list(phone_nums, list_id, display_name)
    @default.create_broadcast_list(phone_nums, list_id, display_name)
  end

  def add_phone_num_to_list(num, list_id)
    @default.add_phone_num_to_list(num, list_id)
  end

  def broadcast_msg(message, list_id)
    @default.broadcast_msg(message, list_id)
  end

end
