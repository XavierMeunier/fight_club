require 'rails_helper'

RSpec.describe FightToWinService, type: :service do

  it "should return a valid fight params hash" do
    fighter1 = create(:fighter, :advanced_fighter)
    fighter2 = create(:fighter, :advanced_fighter)
    
    fight_result = FightToWinService.new({winner: fighter1.id, looser: fighter2.id}).call
    params_hash = { winner_punches: 0, looser_punches: 0, victory_type: :KO, rounds: 0, winner_id: fighter1.id, looser_id: fighter2.id}

    expect(fight_result.keys.sort!).to eq(params_hash.keys.sort!)
  end

  it "should return advanced_fighter as winner" do
    fighter1 = create(:fighter, :advanced_fighter, health: 100, strength: 100)
    fighter2 = create(:fighter)
    
    fight_result = FightToWinService.new({winner: fighter1.id, looser: fighter2.id}).call

    expect(fight_result[:winner_id]).to eq(fighter1.id)
    expect(fight_result[:looser_id]).to eq(fighter2.id)
  end

  it "should be a balanced fight between beginners" do
    fighter1 = create(:fighter)
    fighter2 = create(:fighter)

    wins = {
      fighter1.id => 0,
      fighter2.id => 0
    }

    100.times do
      fight_result = FightToWinService.new({winner: fighter1.reload.id, looser: fighter2.reload.id}).call
      wins[fight_result[:winner_id]] = wins[fight_result[:winner_id]] + 1
    end

    # Should not be unbalanced
    expect(wins[fighter1.id]).to be < 80
    expect(wins[fighter2.id]).to be < 80
  end

end
