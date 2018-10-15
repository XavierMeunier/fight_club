class Fight < ApplicationRecord

  belongs_to :winner, class_name: 'Fighter', inverse_of: 'winned_fights'
  belongs_to :looser, class_name: 'Fighter', inverse_of: 'loosed_fights'

  validates :winner_punches, :looser_punches, :victory_type, :rounds, :winner, :looser, presence: true
  validates :winner_punches, :looser_punches, :rounds, numericality: { only_integer: true }

  enum victory_type: [:KO, :decision]

end
