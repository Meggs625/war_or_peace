class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(cardIdx)
    @cards[cardIdx].rank
  end

  def high_ranking_cards
    high_cards = @cards.select {|elem| elem.rank > 10}
    return high_cards
  end

  def percent_high_ranking
    high_rank_amount = high_ranking_cards.length
    return (high_rank_amount.to_f / @cards.length) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(newCard)
    @cards << newCard
  end
end
