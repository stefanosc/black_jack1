# Object Oriented Blackjack game

# 1) Abstraction
# 2) Encapsulation

class Card
  attr_accessor :suit, :face_value

  def initialize(s, fv)
    @suit = s
    @face_value = fv
  end

  def to_s
    puts "The #{@face_value} of #{@suit}"
  end
end


class Deck
  attr_accessor :number_decks, :cards

  def initialize (num_decks=1)
    @cards = []  
    ["Hearts", "Diamonds", "Clubs", "Spades"].each do |suit|
      ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    
    @number_decks = num_decks 
    @cards *= @number_decks
  end

  def mix
    cards.shuffle!
  end

  def deal player
    player.cards << cards.pop
  end

end


module Playable
  def hit
    
  end

  def stay
    
  end
  
end
  

class Player
  include Playable

  attr_accessor :name, :cards
  @@count = 0

  def initialize (n="Player#{@@count}")
    @name = n
    @cards = []
    @@count += 1
    
  end

# plays
# hits
# stays

end

class Dealer
  include Playable

  attr_accessor :name, :cards

  def initialize (n="Dealer")
  @name = n
  @cards = []
    
  end
# plays
# hits
# stays

end

class Hand



end












# c1 = Card.new('H','3')
# c2 = Card.new('D', '4')

# c1.pretty_output
# c2.pretty_output

# puts c1.suit
# puts c2.suit

# c1.suit = "New Suit for C1"
# c2.suit = "New Suit for c2"

# puts c1.suit
# puts c2.suit







