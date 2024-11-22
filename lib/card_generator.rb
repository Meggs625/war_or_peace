require './lib/card.rb'

class CardGenerator
  attr_reader :cards

  def cards
    cards = []
    File.foreach("./data_files/cards.txt") do |line| 
      value, suit, rank = line.split(',').map(&:strip)
      integer_rank = rank.to_i
      cards << Card.new(suit, value, integer_rank)
    end
    return cards
  end
end