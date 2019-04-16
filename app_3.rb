require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "> Choisis ton pseudo pour cette aventure :"
username = gets.chomp.to_s

puts "> Choisis ton nombre d'ennemies :"
nb_enemies = gets.chomp.to_i

my_game = Game.new(username,nb_enemies)

while my_game.is_still_ongoing? == true
  my_game.show_players
  my_game.menu
  string = gets.chomp.to_s
  my_game.menu_choice(string)
  puts "\n"
  print "Appuies sur une touche pour continuer, Attention ça va faire mal"
  gets.chomp
  my_game.enemies_attack
  puts "\n"
  print "Ca va ? Tu tiens le coup ?\n"
  gets.chomp
end

my_game.end
