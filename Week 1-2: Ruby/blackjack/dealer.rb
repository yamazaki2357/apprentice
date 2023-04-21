# frozen_string_literal: true

# ディーラーを表すクラス
class Dealer < Player
  def show_one_card
    hand.cards.first
  end
end