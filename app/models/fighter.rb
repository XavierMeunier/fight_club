class Fighter < ApplicationRecord

  has_many :winned_fights, class_name: 'Fight', foreign_key: :winner_id, inverse_of: 'winner'
  has_many :loosed_fights, class_name: 'Fight', foreign_key: :looser_id, inverse_of: 'looser'


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  
  before_validation :set_default_fighter, on: :create

  before_save :experience_to_level

  validates :name, :health, :strength, :experience, :level, presence: true
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/gif", "image/png"]  

  def add_experience_from_fight(status, given_punches, received_punches, rounds, opponent_id)
    # Get level gap
    opponent = Fighter.find(opponent_id)
    level_gap = opponent.level - self.level

    # Get experience from fight
    experience_from_punches = given_punches * 2 + received_punches * 1.5
    experience_from_rounds = 10 * rounds

    # Bonus from level gap and fight status
    if status == :winner
      experience_from_punches *= 2
      experience_from_punches *= level_gap if level_gap > 0
    else
      experience_from_rounds *= 2
      experience_from_rounds *= level_gap if level_gap > 0
    end

    winned_experience = (experience_from_punches + experience_from_rounds).round

    add_experience(winned_experience)
  end

private

  def set_default_fighter
    self.health     = 10
    self.strength   = 10
    self.experience = 0
    self.level      = 1
    self.available_upgrade = 10
  end

  def add_experience(winned_experience)
    self.experience += winned_experience
    self.save
  end

  def experience_to_level
    if LEVELS["levels"][self.level] <= self.experience
      self.level += 1
      self.experience = 0
      self.available_upgrade += 10
    end
  end

end
