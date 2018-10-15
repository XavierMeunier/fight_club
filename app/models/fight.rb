class Fight < ApplicationRecord

  belongs_to :winner, class_name: "Fighter"
  belongs_to :looser, class_name: "Fighter"

  validates :winner_punches, :looser_punches, :victory_type, :rounds, :winner, :looser, presence: true
  validates :winner_punches, :looser_punches, :rounds, numericality: { only_integer: true }

  enum victory_type: [:KO, :decision]

end
