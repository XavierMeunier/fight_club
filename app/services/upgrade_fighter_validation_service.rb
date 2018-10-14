class UpgradeFighterValidationService

  def initialize(fighter, fighter_upgrade_params)
    @fighter = fighter
    @fighter_upgrade_params = fighter_upgrade_params
  end

  def call
    check_available_upgrade(@fighter, @fighter_upgrade_params)
  end

private

  def check_available_upgrade(fighter, fighter_upgrade_params)
    health_upgrade_points = fighter_upgrade_params[:health] - fighter.health 
    strength_upgrade_points = fighter_upgrade_params[:strength] - fighter.strength
    needed_upgrade_points = health_upgrade_points + strength_upgrade_points
    
    fighter.available_upgrade >= needed_upgrade_points ? true : false
  end

end