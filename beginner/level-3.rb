class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      # 12 is totally an arbitrary number
      if warrior.health < 12
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
  end
end
