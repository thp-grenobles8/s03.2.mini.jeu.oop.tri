require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")
round = 1

puts "Le combat va bientôt commencer \n Voici l'état des combattants :"
puts player1.show_state
puts player2.show_state
puts ">> passons à la phase de combat \n"
while player1.life_points > 0 && player2.life_points > 0
  print round
  player1.attacks(player2)
  if player2.life_points > 0
    player2.attacks(player1)
  else 
    puts "#{player2.name} ne peut pas répliquer, il est déjà mort"
  end
  round += 1
end

binding.pry
