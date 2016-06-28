class Barracks

  INITIAL_GOLD = 1000
  INITAL_FOOD = 80
  GOLD_TO_TRAIN_FOOTMAN = 135
  GOLD_TO_TRAIN_PEASANT = 90
  FOOD_TO_TRAIN_FOOTMAN = 2
  FOOD_TO_TRAIN_PEASANT = 5


  attr_reader :gold, :food

  def initialize
    @gold = INITIAL_GOLD
    @food = INITAL_FOOD
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

  def can_train_footman?
    (gold >= GOLD_TO_TRAIN_FOOTMAN) && (food >= FOOD_TO_TRAIN_FOOTMAN)
  end

  def can_train_peasant?
    (gold >= GOLD_TO_TRAIN_PEASANT) && (food >= FOOD_TO_TRAIN_PEASANT)
  end

end
