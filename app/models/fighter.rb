class Fighter < ApplicationRecord

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  
  before_validation :set_default_fighter, on: :create

  validates :name, :health, :strength, :experience, :level, presence: true
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/gif", "image/png"]  

private

  def set_default_fighter
    self.health     = 10
    self.strength   = 10
    self.experience = 0
    self.level      = 1
    self.available_upgrade = 10
  end

end
