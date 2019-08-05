class BroadcastList < ApplicationRecord
  has_many :messages
  has_many :subscriptions
  has_many :recipients, through: :subscriptions
  validates :event_code, presence: true
  validates :name, presence: true, uniqueness: true
  def recipients_list
    recipients.map(&:phone_number).join(', ')
  end

  def recipients_phone_numbers
    recipients.map(&:phone_number)
  end

  def recipients_list=(numbers)
    self.recipients = numbers.split(',').map do |n|
      Recipient.where(phone_number: n.strip).first_or_create
    end
  end
end
