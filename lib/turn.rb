class Turn
  attr_reader :player_1, :player_2, :spoils_of_war, :type

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war = []
    @type = :basic
  end

  def define_turn_type
    if @player_1.deck.cards[0].rank == @player_2.deck.cards[0].rank 
      @type = :war
    elsif  (@player_1.deck.cards[0].rank == @player_2.deck.cards[0].rank) && (@player_1.deck.cards[2].rank == @player_2.deck.cards[2].rank)
      @type = :mutually_assured_destruction
    else
      @type = :basic
    end
  end

  def game_winner
    if @type == :war
      if @player_1.deck.cards[2].rank > @player_2.deck.cards[2].rank
        @player_1.name
      else
        @player_2.name
      end
    elsif @type == :mutually_assured_destruction
      "No Winner"
    else 
      if @player_1.deck.cards[0].rank > @player_2.deck.cards[0].rank
        @player_1.name
      else
        @player_2.name
      end
    end
  end

  def pile_cards
    if @type == :war
      player_1_pile = @player_1.deck.cards.slice(0, 3)
      player_2_pile = @player_2.deck.cards.slice(0, 3)
      @spoils_of_war.concat([player_1_pile, player_2_pile])
    elsif @type == :mutually_assured_destruction
      player_1_pile = @player_1.deck.cards.slice!(0, 3)
      player_2_pile = @player_2.deck.cards.slice!(0, 3)
    else
      player_1_pile = @player_1.deck.cards.slice!(0)
      player_2_pile = @player_2.deck.cards.slice!(0)
      @spoils_of_war.concat([player_1_pile, player_2_pile]) 
    end
  end

  def award_spoils
    winner = game_winner
    if winner == @player_1.name
      @player_1.deck.cards.concat(@spoils_of_war)
    else 
      @player_2.deck.cards.concat(@spoils_of_war)
    end
    @spoils_of_war = []
  end

end
