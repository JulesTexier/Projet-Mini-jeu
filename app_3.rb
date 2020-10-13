require 'bundler'
require "pry"


require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

class Game
  attr_accessor :human_player, :enemies

  def initialize (name) #initialisation d'une partie avec les paramètres dans la méthode
    player1 = Player.new("Josiane")
    player2 = Player.new("José")
    player3 = Player.new("Maria")
    player4 = Player.new("Ricardo")
    @enemies = [player1, player2, player3, player4]
    @human_player = HumanPlayer.new(name)
  end

  def kill_player(player) #tue un player
    @enemies.delete(player)
  end

  def is_still_ongoing? #verifie si la partie est toujours en cours
    if @human_player.life_points > 0 && @enemies.length > 0
      true
    else
      false
    end
  end

  def show_players #affiche les informations sur l'état du joueur et le nombre de bots encore présent
    puts "#{@human_player.name}, tu as #{@human_player.life_points} points de vie et une arme de niveau #{@human_player.weapon_level}"
    puts "Il reste #{@enemies.length} enemies à combattre"
  end

end
binding.pry
