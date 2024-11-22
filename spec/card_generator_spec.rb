require 'rspec'
require './lib/card_generator.rb'
require './lib/card.rb'

RSpec.describe CardGenerator do
  
  it "Should exist" do
    generator = CardGenerator.new()
    expect(generator).to be_an_instance_of(CardGenerator)
  end

  it "Should return an array of cards" do
    generator = CardGenerator.new()
    cards = generator.cards
    first_card = cards[0]
    expect(first_card).to be_an_instance_of(Card)
    expect(first_card.rank).to eq(2)
    expect(first_card.suit).to eq("Heart")
  end

  it "Should create a full 52 card deck" do 
    generator = CardGenerator.new()
    cards = generator.cards
    expect(cards.length).to eq(52)
  end

end