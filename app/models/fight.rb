class Fight < ApplicationRecord

  belongs_to :winner, class_name: 'Fighter', inverse_of: 'winned_fights'
  belongs_to :looser, class_name: 'Fighter', inverse_of: 'loosed_fights'

  validates :winner_punches, :looser_punches, :victory_type, :rounds, :winner, :looser, presence: true
  validates :winner_punches, :looser_punches, :rounds, numericality: { only_integer: true }

  enum victory_type: [:KO, :decision]

  after_create_commit  :add_experience_to_fighters

private

  def add_experience_to_fighters
    self.winner.add_experience_from_fight(:winner, self.winner_punches, self.looser_punches, self.rounds, self.looser_id)
    self.looser.add_experience_from_fight(:looser, self.looser_punches, self.winner_punches, self.rounds, self.winner_id)
  end

end
