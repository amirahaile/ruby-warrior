class Player
  def initialize
    @rescued = false
  end

  def play_turn(warrior)
    if @health == nil
      @health = warrior.health
    end

    if @rescued == false
      if warrior.feel(:backward).wall?
        warrior.walk!
      elsif warrior.feel(:backward).captive?
        @rescued = true
        warrior.rescue!(:backward)
      else
        warrior.walk!(:backward)
      end
    elsif warrior.feel.empty?
      # if current health is worse than the previous turn's
      if @health > warrior.health
        if warrior.health < 10
          warrior.walk!(:backward)
        else
          warrior.walk!
        end
      elsif @health < 15
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end

    @health = warrior.health
  end
end
