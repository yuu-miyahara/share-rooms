class Room < ApplicationRecord
  validates :room_name, presence: true, length: { maximum:50 }
  has_secure_password 
  has_many :talks
  
  def self.search(search)
      return Room.all unless search
      Room.where(['room_name LIKE ?', "%#{search}%"])
  end
end
