class Recipient < ApplicationRecord
  has_many :subscriptions
  has_many :broadcast_lists, through: :subscriptions
  validates :phone_number, uniqueness: true, format:
      { with: /\A\+?[1-9]\d{1,14}\z/,
        message: 'E.164 mobile number allowed.' }
end
