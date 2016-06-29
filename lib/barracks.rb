class Barracks

  MAX_GOLD = 1000
  MAX_FOOD = 80
  MAX_LUMBER = 500
  BARRACKS_MAX_HEALTH = 500

  GOLD_TO_TRAIN_FOOTMAN = 135
  GOLD_TO_TRAIN_PEASANT = 90
  GOLD_TO_BUILD_SIEGE_ENGINE = 200

  FOOD_TO_TRAIN_FOOTMAN = 2
  FOOD_TO_TRAIN_PEASANT = 5
  FOOD_TO_BUILD_SIEGE_ENGINE = 3

  LUMBER_TO_BUILD_SIEGE_ENGINE = 60


  attr_reader :gold, :food, :lumber, :health_points

  def initialize
    @gold = MAX_GOLD
    @food = MAX_FOOD
    @lumber = MAX_LUMBER
    @health_points = BARRACKS_MAX_HEALTH
  end

  def train_footman
    return nil unless can_train_footman?
    @gold -= GOLD_TO_TRAIN_FOOTMAN
    @food -= FOOD_TO_TRAIN_FOOTMAN
    Footman.new
  end

  def train_peasant
    return nil unless can_train_peasant?
    @gold -= GOLD_TO_TRAIN_PEASANT
    @food -= FOOD_TO_TRAIN_PEASANT
    Peasant.new
  end

  def build_siege_engine
    return nil unless can_build_siege_engine?
    @gold -= GOLD_TO_BUILD_SIEGE_ENGINE
    @food -= FOOD_TO_BUILD_SIEGE_ENGINE
    @lumber -= LUMBER_TO_BUILD_SIEGE_ENGINE
    SiegeEngine.new
  end

  def can_train_footman?
    (gold >= GOLD_TO_TRAIN_FOOTMAN) && (food >= FOOD_TO_TRAIN_FOOTMAN)
  end

  def can_train_peasant?
    (gold >= GOLD_TO_TRAIN_PEASANT) && (food >= FOOD_TO_TRAIN_PEASANT)
  end

  def can_build_siege_engine?
    (gold >= GOLD_TO_BUILD_SIEGE_ENGINE) && (food >= FOOD_TO_BUILD_SIEGE_ENGINE) && (lumber >= LUMBER_TO_BUILD_SIEGE_ENGINE)
  end

  def damage(attack_power)
    @health_points = @health_points - attack_power
  end

end
