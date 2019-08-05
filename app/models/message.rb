# frozen_string_literal: true
class Message < ApplicationRecord
  belongs_to :broadcast_list
  validates :send_at, presence: true
  validates :txt, length:
      { in: 2..100, wrong_length: '2 to 100 characters required' }
  attribute :send_at_datetime, :string
  attribute :time_zone, :string
  before_save :convert_local_timezone_to_utc

  def send_at_datetime
    send_at
  end

  def send_at_datetime=(time)
    self.send_at = time
  end

  def convert_local_timezone_to_utc
    Time.use_zone(time_zone) do
      time = Time.zone.parse(send_at)
      self.send_at = Time.zone.local_to_utc(time).to_s
    end
  end

end
