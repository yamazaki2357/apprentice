# frozen_string_literal: true

# プレイヤーを表すクラス
class Player
  attr_reader :hand

  def initialize
    @hand = Hand.new
  end

  def hit(card)
    hand.add_card(card)
  end
end
