require 'rails_helper'

RSpec.describe Fighter, type: :model do

  it { should validate_presence_of(:name).on(:update) }
  it { should validate_presence_of(:health).on(:update) }
  it { should validate_presence_of(:strengh).on(:update) }
  it { should validate_presence_of(:experience).on(:update) }
  it { should validate_presence_of(:level).on(:update) }

  it "should set default fighter attribute on creation" do
    fighter = build(:fighter, health: 12, strengh: 13, experience: 14, level: 15, available_upgrade: 16)
    
    expect(fighter.save).to be true
    expect(fighter.health).to eq(10)
    expect(fighter.strengh).to eq(10)
    expect(fighter.experience).to eq(0)
    expect(fighter.level).to eq(1)
    expect(fighter.available_upgrade).to eq(10)
  end

  it "should not set default attribute on update" do
    fighter = create(:fighter, :advanced_fighter)
    fighter.health = fighter.health + 1
    fighter_old_strengh = fighter.strengh
    fighter_old_level = fighter.level
    fighter_old_experience = fighter.experience
    fighter_old_available_upgrade = fighter.available_upgrade

    expect{ fighter.save }.to_not change{
                                    [fighter.reload.strengh, fighter.reload.level, fighter.reload.experience, fighter.reload.available_upgrade]
                                  }.from(
                                    [fighter_old_strengh, fighter_old_level, fighter_old_experience, fighter_old_available_upgrade]
                                  )
  end

end
