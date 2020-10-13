
class Player
    attr_accessor :name, :life_points

    #création de la def initialize avec les 2 attributs
    def initialize(name)
        @name = name
        @life_points = 10
    end

    #afficher l'état d'un joueur avec show_state
    def show_state
        puts ""
        puts "#{@name}, tu as #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    #subir une attaque avec gets_damage 
    def gets_damage(less_points)
        @life_points = @life_points - less_points 
        if @life_points <= 0
            puts "le fantôme #{@name} a été capturé"
        end
    end

    #Player : attaquer avec attacks
    def attacks(player)
        puts "#{@name} attaque #{player.name}"
        damage = compute_damage
        puts " il lui inflige #{damage} points dommages"
        player.gets_damage(damage)
    end

    #calculer les dommages que player1 va faire subir à player2
    def compute_damage
        return rand(1..6)
    end

end

#création de la sous-classe HumanPlayer avec son attribut @weapon_level
class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    #HumanPlayer : augmenter les dommages causés
    def compute_damage
        rand(1..6) * @weapon_level
    end

    #HumanPlayer : chercher une nouvelle arme
    def search_weapon
        dice = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{dice}"
        if dice > weapon_level
            @weapon_level = dice
        else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
        puts"////////////////////////////////////////////////"
        puts" "
    end

    #HumanPlayer : chercher un pack de points de vie
    def search_health_pack
        dice = rand(1..6)
        if dice == 1
            puts "Tu n'as rien trouvé... "
        elsif dice > 1 && dice < 6 
            @life_points += 50 
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"   
            if @life_points > 100
                @life_points = 100
            end
        elsif dice == 6 
            @life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            if @life_points > 100
                @life_points = 100
            end
        end
    end

end

