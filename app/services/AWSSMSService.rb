require 'singleton'

require 'aws-sdk'

# AWS SMS Service. Uses AWS SNS to send mass SMS
class AWSSMSService
  include Singleton
  def initialize
    @client = Aws::SNS::Resource.new(
      access_key_id: Rails.application.credentials.aws_sns[:access_key_id],
      secret_access_key:
        Rails.application.credentials.aws_sns[:secret_access_key]
    )
  end

  def create_broadcast_list(phone_nums, list_id, display_name)
    topic = @client.create_topic(
      name: list_id,
      attributes: { "DisplayName": display_name }
    )
    phone_nums.each do |num|
      topic.subscribe(protocol: 'sms', endpoint: num)
    end
  end

  def add_phone_num_to_list(num, list_id)
    # Idempotent method, will return list_id if already exists
    topic = @client.create_topic(name: list_id)
    topic.subscribe(protocol: 'sms', endpoint: num)
  end

  def broadcast_msg(message, list_id)
    # Idempotent method, will return list_id if already exists
    topic = @client.create_topic(name: list_id)
    topic.publish(
      message: message,
      message_attributes: {
        'AWS.SNS.SMS.SMSType' => {
          data_type: 'String', # required
          string_value: 'Transactional'
        }
      }
    )
  end
end
