# frozen_string_literal: true

# トランプのカードを表すクラス
class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{suit}の#{value}"
  end

  def point
    case value
    when "A" then 11
    when "K", "Q", "J" then 10
    else value.to_i
    end
  end
end
