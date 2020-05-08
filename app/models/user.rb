class User < ApplicationRecord
  validates :name, presence: true, length: { maximum:15}
  validates :ban_number, presence: true
  
  has_many :talks
  has_many :bans
  has_many :reporters, through: :bans, source: :banner
  
  def ban(other_user)
    unless self == other_user
      self.bans.find_or_create_by(banner_id: other_user.id)
    end
  end
  
  def reset(other_user)
    unless self == other_user
      object = self.bans.find_by(banner_id: other_user.id)
      object.destroy if object
    end
  end
  
  def banning?(other_user)
    self.reporters.include?(other_user)
  end
end
