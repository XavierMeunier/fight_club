require 'rails_helper'

RSpec.describe UpgradeFighterValidationService, type: :service do

  it "should valid upgrade" do
    fighter = build(:fighter, health: 12, strength: 13, experience: 14, level: 15, available_upgrade: 16)
    
    upgrade_validation_service = UpgradeFighterValidationService.new(fighter, {health: 21, strength: 20})
    expect(upgrade_validation_service.call).to be true
  end

  it "should valid upgrade even if upgrade points are lower than available points" do
    fighter = build(:fighter, health: 12, strength: 13, experience: 14, level: 15, available_upgrade: 16)
    
    upgrade_validation_service = UpgradeFighterValidationService.new(fighter, {health: 14, strength: 15})
    expect(upgrade_validation_service.call).to be true
  end

  it "should not valid upgrade" do
    fighter = build(:fighter, health: 12, strength: 13, experience: 14, level: 15, available_upgrade: 16)
    
    upgrade_validation_service = UpgradeFighterValidationService.new(fighter, {health: 22, strength: 23})
    expect(upgrade_validation_service.call).to be false
  end

end
