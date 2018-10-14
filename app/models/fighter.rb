class Fighter < ApplicationRecord

  validates :name, :health, :strength, :experience, :level, presence: true

  before_validation :set_default_fighter, on: :create


private

  def set_default_fighter
    self.health     = 10
    self.strength    = 10
    self.experience = 0
    self.level      = 1
    self.available_upgrade = 10
  end

end
