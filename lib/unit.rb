class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def damage(attack_power)
    @health_points -= attack_power 
    @health_points = 0 if @health_points < 0
  end

  def attack!(enemy)
    (dead? || enemy.dead?) ? nil : enemy.damage(@attack_power)
  end

  def dead?
    health_points == 0
  end

end