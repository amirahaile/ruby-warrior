class Player
  def play_turn(warrior)
    if @health == nil
      @health = warrior.health
    end

    if warrior.feel.empty?
      if @health > warrior.health
        warrior.walk!
      elsif @health < 15
        warrior.rest!
      else
        warrior.walk!
      end
    else
      if warrior.feel.captive?
        warrior.rescue!
      else
        warrior.attack!
      end
    end

    @health = warrior.health
  end
end
