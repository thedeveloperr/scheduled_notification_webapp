class Subscription < ApplicationRecord
  belongs_to :broadcast_list
  belongs_to :recipient
end
