require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

  before :all do
    card_1 = Card.new(:heart, "Queen", 12)
    card_2 = Card.new(:diamond, "King", 13)
    card_3 = Card.new(:spade, "Ace", 14)
    card_4 = Card.new(:club, "9", 9)
    card_5 = Card.new(:diamond, "Jack", 11)
    card_6 = Card.new(:heart, "Ace", 14)
    card_7 = Card.new(:spade, "7", 7)
    card_8 = Card.new(:club, "King", 13)
    card_9 = Card.new(:diamond, "10", 10)
    card_10 = Card.new(:spade, "8", 8)

    basic_cards_1 = [card_1, card_2, card_3, card_4]
    basic_cards_2 = [card_5, card_6, card_7, card_8]
    @basic_deck_1 = Deck.new(basic_cards_1)
    @basic_deck_2 = Deck.new(basic_cards_2)

    war_cards_1 = [card_2, card_1, card_4, card_3]
    war_cards_2 = [card_8, card_5, card_6, card_7]
    @war_deck_1 = Deck.new(war_cards_1)
    @war_deck_2 = Deck.new(war_cards_2)

    destruction_cards_1 = [card_2, card_1, card_3, card_4, card_10]
    destruction_cards_2 = [card_8, card_5, card_6, card_7, card_9]

    @destruction_deck_1 = Deck.new(destruction_cards_1)
    @destruction_deck_2 = Deck.new(destruction_cards_2)

  end

  it "Exists" do
    player_1 = Player.new("Marsha", @basic_deck_1)
    player_2 = Player.new("Patrick", @basic_deck_2)
    turn = Turn.new(player_1, player_2)
    expect(turn).to be_an_instance_of(Turn)
  end

  it "Holds the players names" do 
    player_1 = Player.new("Marsha", @basic_deck_1)
    player_2 = Player.new("Patrick", @basic_deck_2)
    turn = Turn.new(player_1, player_2)
    expect(turn.player_1.name).to eq("Marsha")
    expect(turn.player_2.name).to eq("Patrick")
  end

  it "Should hold cards won from war" do
    player_1 = Player.new("Marsha", @basic_deck_1)
    player_2 = Player.new("Patrick", @basic_deck_2)
    turn = Turn.new(player_1, player_2)
    expect(turn.spoils_of_war).to eq([])
  end 

  it "Should determine what the game type is" do 
    player_1 = Player.new("Marsha", @basic_deck_1)
    player_2 = Player.new("Patrick", @basic_deck_2)
    turn = Turn.new(player_1, player_2)
    turn.define_turn_type
    expect(turn.type).to eq(:basic)

    war_player_1 = Player.new("Marshall", @war_deck_1)
    war_player_2 = Player.new("Patrice", @war_deck_2)
    turn_2 = Turn.new(war_player_1, war_player_2)
    turn_2.define_turn_type
    expect(turn_2.type).to eq(:war)

    destruction_player_1 = Player.new("Marcus", @destruction_deck_1)
    destruction_player_2 = Player.new("Paco", @destruction_deck_2)
    turn_3 = Turn.new(destruction_player_1 , destruction_player_2)
    turn_3.define_turn_type
    expect(turn_3.type).to eq(:mutually_assured_destruction)
  end

  # it "Should determine a turn winner" do
  #   winner = @turn.game_winner
  #   expect(winner).to eq("Marsha")
  # end

  # it "Should add the correct amount to the spoils pile" do
  #   @turn.pile_cards
  #   expect(@turn.spoils_of_war).to eq([@card_1, @card_5])
  # end

  # it "Should add the spoils to the winning player's deck" do
  #   @turn.pile_cards
  #   @turn.award_spoils
  #   expect(@turn.player_1.deck.cards).to include(@card_5)
  # end

end