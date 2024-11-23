require './lib/deck.rb'
require './lib/card_generator.rb'

class Game

  def initialize()
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"

    input = gets.chomp.upcase

    if input == "GO"
      execute_new_game
    else
      p "Invalid response"
    end
  end

  def execute_new_game
    deck_1, deck_2 = create_new_decks
    # create two players
    # execute continual turns
    # determine when there is a winner or if the number of turns is more than 1M and end in a draw
    p "New game started"
  end

  def create_new_decks
    cards = CardGenerator.new().cards
    shuffled_cards = cards.shuffle
    return shuffled_cards.each_slice(26).to_a

  end

end