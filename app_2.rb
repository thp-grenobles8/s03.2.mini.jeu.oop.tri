require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "> Choisis ton pseudo pour cette aventure : "
username = gets.chomp.to_s
user = HumanPlayer.new(username)
enemies = []
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies << player1
enemies << player2

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
  puts "\n\n"
  puts user.show_state
  # affichage du menu
  puts "# Quelle action veux-tu effectuer ce tour-ci ?\n\n# a - chercher une meilleure arme\n# s - chercher à se soigner\n\n# attaquer un joueur en vue :"
  puts "# 0 - #{player1.name} a #{player1.life_points} points de vie"
  puts "# 1 - #{player2.name} a #{player2.life_points} points de vie"
  action = gets.chomp
  # affectation du choix du joueur
  if action == "a"
    user.search_weapon
  elsif action == "s"
    user.search_health_pack
  elsif action == "0"
    user.attacks(player1)
  else action == "1"  
    user.attacks(player2)
  end
  puts "\n"
  print "Appuies sur une touche pour continuer"
  gets.chomp
  if user.life_points < 1
    puts "T'es nul t'as perdu"
  elsif player1.life_points > 0 || player2.life_points > 0
    puts "\n Maintenant c'est au tour des ennemies de répliquer !"
    for index_enemy in 0..(enemies.length - 1) do 
      enemies[index_enemy].life_points > 0 ? enemies[index_enemy].attacks(user) : false   # les ennemies répliquent que si ils sont vivants
    end
  else
    puts "***FIN DU JEU***\n"
    puts "Tu les as tous bousillé bien joué !!"
  end
  puts "\n"
  print "Appuies sur une touche pour continuer"
  gets.chomp
end