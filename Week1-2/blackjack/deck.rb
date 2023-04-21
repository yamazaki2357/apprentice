# frozen_string_literal: true

# トランプのデッキを表すクラス
class Deck
  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    suits = ["ハート", "ダイヤ", "クラブ", "スペード"]
    values = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    suits.product(values).map { |suit, value| Card.new(value, suit) }.shuffle
  end

  def draw
    cards.pop
  end
end
