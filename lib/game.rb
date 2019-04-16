
class Game

  attr_accessor :human_player, :enemies

  def initialize(name,enemies)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    enemies_name = []
    for x in 0..(enemies-1) do # Permet de générer des noms pour X adversaires sous la forme Robotueur X
       enemies_name << "Robotueur " + x.to_s
    end
    for x in 0..(enemies-1) do
      @enemies << Player.new(enemies_name[x])
    end
  end

  def kill_player(player)
    @enemies.delete(player)
    puts "#{player.name} est mort dans d'atroces souffrances ..."
  end

  def is_still_ongoing?
    @human_player.life_points > 1 && @enemies.length > 0 ? true : false
  end

  def show_players
    puts "#{@human_player.show_state}\nIl reste #{@enemies.length} ennemies!!\n"
    puts "\n"
  end

  def menu
    puts "# Quelle action veux-tu effectuer ce tour-ci ?\n\n# a - chercher une meilleure arme\n# s - chercher à se soigner\n\n# attaquer un joueur en vue :"
    for list_enemies in 0..(@enemies.length-1) do
      puts "##{list_enemies} #{@enemies[list_enemies].name} a #{@enemies[list_enemies].life_points} points de vie"
    end
  end

  def menu_choice(string)
    if string == "a"
      @human_player.search_weapon
    elsif string == "s"
      @human_player.search_health_pack
    else
      @human_player.attacks(@enemies[string.to_i])
      if @enemies[string.to_i].life_points < 1
        kill_player(@enemies[string.to_i])
      end
    end
  end

  def enemies_attack
    puts "\nMaintenant c'est au tour des ennemies de répliquer !"
    for index_enemy in 0..(@enemies.length-1) do 
      enemies[index_enemy].attacks(@human_player)
    end
  end

  def end
    puts "++++ Le jeu est fini ++++"
    if @human_player.life_points > 1
      puts "BRAVO tu as survécu face aux forces du mal, Gandalf est fier de toi"
    else
      puts "Apparemment non ..."
      puts 'Allez recommence'
    end
  end

end