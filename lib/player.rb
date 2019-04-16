class Player

  attr_accessor :name, :life_points 

  def initialize(name,life_points = 10)
    @name = name
    @life_points = life_points.to_i
  end

  def show_state
    puts ">>>> Le joueur #{name} a #{life_points} HP <<<<"
  end

  def get_damage(nb_damages)
    damages = nb_damages.to_i
    if @life_points < 1
      puts "Le Joueur #{name} est déja mort, pas besoin de s'acharner sur son cadavre"
      @life_points = 0
    else 
      @life_points = @life_points - damages
      if @life_points > 0
        puts "Le joueur #{name} vient d'encaisser #{damages} DMG ! \n Il reste #{life_points} HP à #{name}\n"
      else
        puts "#Le joueur a térassé le joueur #{name} en lui infligeant #{damages} DMG"
        @life_points = 0
      end
    end
  end

  def compute_damage
    return rand(1..6)
  end

  def attacks(attacked_player)
    random_dmg = compute_damage
    puts ">> #{name} attaque #{attacked_player.name} \n"
    attacked_player.get_damage(random_dmg)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name,life_points = 100,weapon_level = 1)
    @weapon_level = weapon_level.to_i
    super(name,life_points)
  end

  def show_state
    puts "Le joueur #{name} a #{life_points} HP et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    found_weapon_level = rand(1..6)
    print "Tu as trouvé une arme de niveau #{found_weapon_level} !!\n"
    if @weapon_level < found_weapon_level
      @weapon_level = found_weapon_level
      puts "Tu t'équipes de la nouvelle arme de niveau #{found_weapon_level} ! Tu vas bousiller du bot !"
    else
      puts "Tu te rends compte que cette arme est merdique.\nTu te cures les dents avec et la jettes dans les égouts \n **bruit de crachat**"
    end
  end

  def search_health_pack
    found_health_pack = rand(1..6)
    if found_health_pack == 1
      puts "Tu n'as rien trouvé, il ne te reste que tes yeux pour pleurer \n Tu as #{life_points} pdv"
    elsif found_health_pack == 6
      @life_points <= 20 ? @life_points = @life_points + 80 : @life_points = 100
      puts "Tu as trouvé une SUPER potion petit chanceux, tu gagnes 80 HP"
      puts ">> Tu as #{@life_points} HP"
    else
      puts "Tu as trouvé une potion classique, tu gagnes 50 HP"
      @life_points <= 50 ? @life_points = @life_points + 50 : @life_points = 100
      puts ">> Tu as #{@life_points} HP"
    end
  end
end

