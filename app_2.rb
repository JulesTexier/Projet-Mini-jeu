require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


# Message de démarrage du jeu et initialisation du joueur
def welcome
    puts"--------------------------------------------------"
    puts"|Bienvenue sur 'Ghost Busters' !                 |"
    puts"|Le but du jeu est de capturer tous les fantômes |"
    puts"--------------------------------------------------"
    puts" "
    puts "D'abord, pour te mettre dans l'ambiance, je t'invite à cliquer sur ce lien : "
    puts "https://www.youtube.com/watch?v=m9We2XsVZfc&ab_channel=PrestigeGhost"

    puts "Quel est ton prénom ?"
    print ">"
    name = gets.chomp
    user = HumanPlayer.new(name)
    player1 = Player.new("Azetlor le Destructeur")
    player2 = Player.new("Bouffe-tout")    
    enemies = [player1,player2]
    fight(user, enemies, player1, player2)
end

#On lance le combat 
def fight(user, enemies, player1, player2)
    while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
            user.show_state
            puts "
            Quelle action veux-tu effectuer ?

            a - chercher une meilleure arme
            s - chercher à se soigner 
            
            attaquer un joueur en vue :
            0 - Azetlor le Destructeur a #{player1.life_points} points de vie
            1 - Bouffe-tout a #{player2.life_points} points de vie"

        print ">"
        choice = gets.chomp

            if choice == "a" 
                user.search_weapon
            elsif choice == "s"
                user.search_health_pack
            elsif choice == "0"
                user.attacks(player1)
            elsif choice == "1"
                user.attacks(player2)
            end
       
            puts "Les autres joueurs t'attaquent !"
            puts ""
        enemies.each do |x|
            break if x.life_points <= 0
            x.attacks(user)
            end
    end

        if user.life_points > 0
            puts "BRAVO ! TU AS GAGNE !"
            else 
            puts "Loser ! Tu as perdu !"
        end
end

welcome