class Fight < ApplicationRecord
  belongs_to :winner, class_name: 'Fighter', inverse_of: 'winned_fights'
  belongs_to :looser, class_name: 'Fighter', inverse_of: 'lost_fights'

  validates :winner_punches, :looser_punches, :victory_type, :rounds, :winner, :looser, presence: true
  validates :winner_punches, :looser_punches, :rounds, numericality: { only_integer: true }

  enum victory_type: [:KO, :decision]

  after_create_commit  :add_experience_to_fighters

  scope :KO,        -> { where(victory_type: :KO) }
  scope :decision,  -> { where(victory_type: :decision) }

  private

    def add_experience_to_fighters
      winner.add_experience_from_fight(:winner, winner_punches, looser_punches, rounds, looser_id)
      looser.add_experience_from_fight(:looser, looser_punches, winner_punches, rounds, winner_id)
    end
end
