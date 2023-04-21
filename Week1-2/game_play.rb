# frozen_string_literal: true

require "./blackjack/card.rb"
require "./blackjack/deck.rb"
require "./blackjack/game.rb"
require "./blackjack/hand.rb"
require "./blackjack/player.rb"
require "./blackjack/dealer.rb"

game = Game.new
game.play
