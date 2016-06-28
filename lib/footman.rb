# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  FOOTMAN_MAX_HEALTH = 60
  FOOTMAN_MAX_ATTACK_POWER = 10

  def initialize
    super(FOOTMAN_MAX_HEALTH, FOOTMAN_MAX_ATTACK_POWER)
  end

end
