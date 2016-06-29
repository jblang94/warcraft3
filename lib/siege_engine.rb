class SiegeEngine < Unit

  MAX_HEALTH = 400
  MAX_ATTACK_POWER = 50

  def initialize
    super(MAX_HEALTH, MAX_ATTACK_POWER)
  end

  def attack!(enemy)
    unless protected_enemy?(enemy)
      if enemy.is_a?(Barracks)
        attack_barracks!(enemy)
      else
        super(enemy)
      end
    end
  end

  private

  def protected_enemy?(enemy)
    enemy.is_a?(Unit) && !enemy.is_a?(SiegeEngine)
  end

  def attack_barracks!(barracks)
    barracks.damage(2 * MAX_ATTACK_POWER) unless dead?
  end

end