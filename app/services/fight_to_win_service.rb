class FightToWinService
  def initialize(fighters)
    @fighter1 = Fighter.find(fighters[:winner])
    @fighter2 = Fighter.find(fighters[:looser])
  end

  def call
    fight
  end

  private

    attr_reader :fighter1, :fighter2

    def fight
      fight_exchange = 0
      punches_counter = {}
      punches_counter[fighter1.id] = 0
      punches_counter[fighter2.id] = 0

      # Fight until KO or time out
      while fighter1.health.positive? && fighter2.health.positive? && fight_exchange < 99
        strikers = fighter_order

        # Define punch force
        tiredness_factor = rand(0.0..(fight_exchange.to_f / 100)).round(2)
        punch_power = rand(0.0..(1.0 - tiredness_factor)).round(2)

        strikers[1].health = strikers[1].health - (strikers[0].strength * punch_power)

        punches_counter[strikers[0].id] += 1

        fight_exchange += 1
      end

      fight_result = compute_fight_statistics(fighter1, fighter2, punches_counter)

      # A round every ten fight_exchange
      fight_result[:rounds] = (fight_exchange + 10) / 10

      fight_result
    end

    # Random order between fighter
    def fighter_order
      [fighter1, fighter2].shuffle
    end

    # Get winner / looser statistics
    def compute_fight_statistics(fighter1, fighter2, punches_counter)
      fight_result = {}

      # Fighter 1 win (KO or decision)
      if fighter2.health <= 0 || (fighter1.health.positive? && punches_counter[fighter1.id] > punches_counter[fighter2.id])
        fight_result[:winner_id] = fighter1.id
        fight_result[:winner_punches] = punches_counter[fighter1.id]

        fight_result[:looser_id] = fighter2.id
        fight_result[:looser_punches] = punches_counter[fighter2.id]
      
      # Fighter 2 win (KO or decision)
      elsif fighter1.health <= 0 || (fighter2.health.positive? && punches_counter[fighter2.id] > punches_counter[fighter1.id])
        fight_result[:winner_id] = fighter2.id
        fight_result[:winner_punches] = punches_counter[fighter2.id]

        fight_result[:looser_id] = fighter1.id
        fight_result[:looser_punches] = punches_counter[fighter1.id]

      # Random winner according to really nice artistic move during fight judged by jury (exceptionnal case)
      else
        winner_looser = fighter_order

        fight_result[:winner_id] = winner_looser[0].id
        fight_result[:winner_punches] = punches_counter[winner_looser[0].id]

        fight_result[:looser_id] = winner_looser[1].id
        fight_result[:looser_punches] = punches_counter[winner_looser[1].id]
      end

      fight_result[:victory_type]= fighter1.health <= 0 || fighter2.health <= 0 ? :KO : :decision

      fight_result
    end
end
