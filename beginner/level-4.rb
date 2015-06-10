class Player
  def play_turn(warrior)
    if @health == nil
      @health = warrior.health
    end

    if warrior.feel.empty?
      if @health > warrior.health
        warrior.walk!
      elsif @health < 10
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
