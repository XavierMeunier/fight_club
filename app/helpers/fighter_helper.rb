module FighterHelper

  def given_punches
    punches = 0
    punches += @fighter.winned_fights.pluck(:winner_punches).inject(&:+).to_i
    punches += @fighter.loosed_fights.pluck(:looser_punches).inject(&:+).to_i
    punches
  end

  def received_punches
    punches = 0
    punches += @fighter.winned_fights.pluck(:looser_punches).inject(&:+).to_i
    punches += @fighter.loosed_fights.pluck(:winner_punches).inject(&:+).to_i
    punches
  end

end
