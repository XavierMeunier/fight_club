require 'rails_helper'

RSpec.describe Fighter, type: :model do

  it { should validate_presence_of(:name).on(:update) }
  it { should validate_presence_of(:health).on(:update) }
  it { should validate_presence_of(:strength).on(:update) }
  it { should validate_presence_of(:experience).on(:update) }
  it { should validate_presence_of(:level).on(:update) }

  it "should set default fighter attribute on creation" do
    fighter = build(:fighter, health: 12, strength: 13, experience: 14, level: 15, available_upgrade: 16)
    
    expect(fighter.save).to be true
    expect(fighter.health).to eq(10)
    expect(fighter.strength).to eq(10)
    expect(fighter.experience).to eq(0)
    expect(fighter.level).to eq(1)
    expect(fighter.available_upgrade).to eq(10)
  end

  it "should not set default attribute on update" do
    fighter = create(:fighter, :advanced_fighter)
    fighter.health = fighter.health + 1
    fighter_old_strength = fighter.strength
    fighter_old_level = fighter.level
    fighter_old_experience = fighter.experience
    fighter_old_available_upgrade = fighter.available_upgrade

    expect{ fighter.save }.to_not change{
                                    [fighter.reload.strength, fighter.reload.level, fighter.reload.experience, fighter.reload.available_upgrade]
                                  }.from(
                                    [fighter_old_strength, fighter_old_level, fighter_old_experience, fighter_old_available_upgrade]
                                  )
  end

  describe "add_experience_from_fight" do

    let(:fighter1) { create(:fighter) }
    let(:fighter2) { create(:fighter) }

    it "should add experience to fighter" do
      fighter1.add_experience_from_fight(:winner, 5, 3, 1, fighter2.id)

      expect(fighter1.experience).to eql(39)
      expect(fighter1.level).to eql(1)
    end

    it "should level up fighter" do
      fighter1.experience = LEVELS["levels"][1] - 10
      fighter1.add_experience_from_fight(:winner, 5, 3, 1, fighter2.id)

      expect(fighter1.experience).to eql(0)
      expect(fighter1.level).to eql(2)
      expect(fighter1.available_upgrade).to eql(20)
    end

  end

end