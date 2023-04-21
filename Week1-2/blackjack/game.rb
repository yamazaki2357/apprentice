# frozen_string_literal: true

# ゲームを制御するクラス
class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_initial_cards
    2.times do
      player.hit(deck.draw)
      dealer.hit(deck.draw)
    end
  end

  def play
    puts "ブラックジャックを開始します。"
    deal_initial_cards

    puts "あなたの引いたカードは#{player.hand.cards[0]}です。"
    puts "あなたの引いたカードは#{player.hand.cards[1]}です。"
    puts "ディーラーの引いたカードは#{dealer.show_one_card}です。"
    puts "ディーラーの引いた2枚目のカードはわかりません。"

    loop do
      puts "あなたの現在の得点は#{player.hand.points}です。カードを引きますか？（Y/N）"
      decision = gets.chomp.downcase
      break if decision == "n"

      if decision == "y"
        card = deck.draw
        player.hit(card)
        puts "あなたの引いたカードは#{card}です。"
        break if player.hand.busted?
      end
    end

    if player.hand.busted?
      puts "あなたの現在の得点は#{player.hand.points}です。"
      puts "バーストしました、あなたの負けです..."
    else
      puts "ディーラーの引いた2枚目のカードは#{dealer.hand.cards[1]}でした。"
      puts "ディーラーの現在の得点は#{dealer.hand.points}です。"

      while dealer.hand.points < 17
        card = deck.draw
        dealer.hit(card)
        puts "ディーラーの引いたカードは#{card}です。"
        puts "ディーラーの現在の得点は#{dealer.hand.points}です。"
      end

      if dealer.hand.busted?
        puts "ディーラーの得点は#{dealer.hand.points}です。あなたの勝ちです！"
      elsif player.hand.points > dealer.hand.points
        puts "あなたの得点は#{player.hand.points}です。"
        puts "ディーラーの得点は#{dealer.hand.points}です。あなたの勝ちです！"
      elsif player.hand.points < dealer.hand.points
        puts "あなたの得点は#{player.hand.points}です。"
        puts "ディーラーの得点は#{dealer.hand.points}です。あなたの負けです..."
      else
        puts "引き分けです。"
      end
      puts "ブラックジャックを終了します。"
    end
  end
end
