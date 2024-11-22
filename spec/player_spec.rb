require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'

RSpec.describe Player do

  before :all do
    @card_1 = Card.new(:heart, "Queen", 12)
    @card_2 = Card.new(:diamond, "King", 13)
    @card_3 = Card.new(:spade, "Ace", 14)
    @card_4 = Card.new(:club, "9", 9)
    cards = [@card_1, @card_2, @card_3, @card_4]
    deck = Deck.new(cards)
    @player_1 = Player.new("Marsha", deck)
  end

  it "Exists as an instance of Player" do
    expect(@player_1).to be_an_instance_of(Player)
  end

  it "The player should have a name" do
    expect(@player_1.name).to eq("Marsha")
  end

  it "Should be able to test if the player has lost the game" do
    expect(@player_1.has_lost?).to eq(false)
  end

  it "Should show that a game is lost when player's deck is empty" do
    @player_1.deck.remove_card
    @player_1.deck.remove_card
    @player_1.deck.remove_card
    @player_1.deck.remove_card
    expect(@player_1.deck.cards).to eq([])
    expect(@player_1.has_lost?).to eq(true)
  end
end