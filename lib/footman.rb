# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  MAX_HEALTH = 60
  MAX_ATTACK_POWER = 10

  def initialize
    super(MAX_HEALTH, MAX_ATTACK_POWER)
  end

  def attack!(enemy) 
    return super(enemy) unless enemy.is_a?(Barracks)
    attack_barracks!(enemy)
  end

  private

  def attack_barracks!(barracks)
    barracks.damage((MAX_ATTACK_POWER/2).ceil) unless dead?
  end


end
