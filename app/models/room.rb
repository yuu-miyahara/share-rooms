class Room < ApplicationRecord
  validates :room_name, presence: true, length: { maximum:50 }
  has_secure_password 
end
