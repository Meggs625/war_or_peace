require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

  before :all do
    @card_1 = Card.new(:heart, "Queen", 12)
    @card_2 = Card.new(:diamond, "King", 13)
    @card_3 = Card.new(:spade, "Ace", 14)
    @card_4 = Card.new(:club, "9", 9)
    cards = [@card_1, @card_2, @card_3, @card_4]
    @deck = Deck.new(cards)
  end

  it "Exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "Returns the rank of a provided card" do
    found_rank = @deck.rank_of_card_at(2)
    expect(found_rank).to eq(14)
  end

  it "Can identify high value cards" do
    high_value = @deck.high_ranking_cards
    expect(high_value).to include(@card_1)
    expect(high_value).to include(@card_2)
    expect(high_value).to include(@card_3)
    expect(high_value).not_to include(@card_4)
  end

  it "Can provide a percentage of high value cards in a deck" do
    high_val_percentage = @deck.percent_high_ranking
    expect(high_val_percentage).to eq(75.0)
  end


  it "Removes the top card from the deck" do
    @deck.remove_card
    expect(@deck.cards.length).to eq(3)
  end

  it "Adds a new card to the bottom of the deck" do
    new_card = Card.new(:heart, "7", 7)
    @deck.add_card(new_card)
    expect(@deck.cards.last).to eq(new_card)
  end

end