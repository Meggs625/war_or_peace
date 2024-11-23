require 'rspec'
require './lib/game.rb'

RSpec.describe Game do

  it ("Should exist") do
    new_game = Game.new
    expect(new_game).to be_an_instance_of(Game)
  end

  # it "Should welcome users" do
  #   new_game = Game.new()
  #   output = new_game.start
  #   expect(output).to include("Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora. Type 'GO' to start the game!------------------------------------------------------------------")
  # end

  it "Should create two new decks" do
    new_game = Game.new
    decks = new_game.create_new_decks
    expect(decks.count).to be(2)
    expect(decks.first).to be_a(Array)
    expect(decks.last).to be_a(Array)
  end

  it "Should create two new playes" do

  end

end