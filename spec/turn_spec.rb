require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

  before :all do
    @card_1 = Card.new(:heart, "Queen", 12)
    @card_2 = Card.new(:diamond, "King", 13)
    @card_3 = Card.new(:spade, "Ace", 14)
    @card_4 = Card.new(:club, "9", 9)

    @card_5 = Card.new(:diamond, "Jack", 11)
    @card_6 = Card.new(:heart, "2", 2)
    @card_7 = Card.new(:spade, "7", 7)
    @card_8 = Card.new(:club, "King", 13)
    cards = [@card_1, @card_2, @card_3, @card_4]
    cards_2 = [@card_5, @card_6, @card_7, @card_8]
    deck = Deck.new(cards)
    deck_2 = Deck.new(cards_2)
    @player_1 = Player.new("Marsha", deck)
    @player_2 = Player.new("Patrick", deck_2)
    @turn = Turn.new(@player_1, @player_2)
  end

  it "Exists" do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it "Holds the players names" do 
    expect(@turn.player_1.name).to eq("Marsha")
    expect(@turn.player_2.name).to eq("Patrick")
  end

  it "Should hold cards won from war" do
    expect(@turn.spoils_of_war).to eq([])
  end 

end