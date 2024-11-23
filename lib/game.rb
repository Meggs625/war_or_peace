require './lib/deck.rb'
require './lib/card_generator.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Game

  attr_reader :round_num

  def initialize()
    @player_1 = nil
    @player_2 = nil
    @round_num = 1
    @turn = nil
    @game_has_a_winner = false
    @winner = nil
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
    cards_1, cards_2 = create_new_decks
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    @player_1 = create_player("One", deck_1)
    @player_2 = create_player("Two",deck_2)
    @turn = Turn.new(@player_1, @player_2)

    while @round_num < 10000000 && !@game_has_a_winner
      perform_turn
    end
    
    end_game
  end

  def create_new_decks
    cards = CardGenerator.new().cards
    shuffled_cards = cards.shuffle
    return shuffled_cards.each_slice(26).to_a
  end

  def create_player(num, deck)
    new_player = Player.new("Player #{num}", deck)
    return new_player
  end

  def perform_turn
    turn_type = @turn.define_turn_type
    game_winner = @turn.game_winner
    @turn.pile_cards
    ending_string = "Turn #{@round_num}: "

    if @turn.type == :war
    ending_string << "WAR - #{game_winner} won #{@turn.spoils_of_war.length} cards"
    elsif @turn.type == :mutually_assured_destruction
      ending_string << "*mutually assured destruction* #{@turn.spoils_of_war.length} cards removed from play"
    else 
      ending_string << "#{game_winner} won #{@turn.spoils_of_war.length} cards"
    end
    puts @player_1.deck.cards.length
    p ending_string

    @turn.award_spoils
    check_for_winner
    @round_num += 1
  end

  def check_for_winner
    if @player_1.has_lost?
      @winner = @player_2.name
      @game_has_a_winner = true
    elsif @player_2.has_lost?
      @winner = @player_1.name
      @game_has_a_winner = true 
    else return
    end
  end

  def end_game
    if @round_num < 1000000
    p "*~*~*~*~*~ #{@winner} has won the game! ~*~*~*~*"
    else 
     p "---- DRAW ----"
    end
  end

end