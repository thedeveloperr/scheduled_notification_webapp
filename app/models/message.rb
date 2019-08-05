# frozen_string_literal: true
class Message < ApplicationRecord
  belongs_to :broadcast_list
  validates :send_at, presence: true
  validates :txt, length:
      { in: 2..100, wrong_length: '2 to 100 characters required' }
  def send_at_datetime
    send_at
  end

  def send_at_datetime=(date_time)
    self.send_at = date_time.to_time
  end
end
