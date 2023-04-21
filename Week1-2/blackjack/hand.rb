# frozen_string_literal: true

# 手札を表すクラス
class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  def points
    aces = 0
    total = cards.inject(0) do |sum, card|
      aces += 1 if card.value == "A"
      sum + card.point
    end

    aces.times { total -= 10 if total > 21 }
    total
  end

  def busted?
    points > 21
  end
end
