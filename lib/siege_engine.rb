class SiegeEngine < Unit

  SIEGE_ENGINE_MAX_HEALTH = 400
  SIEGE_ENGINE_MAX_ATTACK_POWER = 50

  def initialize
    super(SIEGE_ENGINE_MAX_HEALTH, SIEGE_ENGINE_MAX_ATTACK_POWER)
  end

  def attack!(enemy)
    unless enemy.is_a?(Unit) && !enemy.is_a?(SiegeEngine)
      if enemy.is_a?(Barracks)
        enemy.damage(2 * SIEGE_ENGINE_MAX_ATTACK_POWER)
      else
        enemy.damage(SIEGE_ENGINE_MAX_ATTACK_POWER)
      end
    end
  end

end