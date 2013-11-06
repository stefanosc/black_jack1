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
      ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    
    @number_decks = num_decks 
    @cards *= @number_decks
  end

  def mix
    cards.shuffle!.shuffle!.shuffle!
  end

  def deal player
    player.cards << cards.pop
  end

end


module Hand
  def hit
    
  end

  def stay
    
  end

  def total 
    total = 0
    aces = 0
    cards.each do |card|
      if card.face_value.to_i > 0
        total += card.face_value.to_i
        puts card.face_value + "to i > 0"
        puts total
      elsif card.face_value == "Ace"
        puts card.face_value + "ace"
        total += 11
        aces +=1
        puts total
      else
        total += 10
        puts card.face_value
        puts total
      end
    end
    while total > 21 and aces > 0
      aces.times do
        total -= 10
        aces -= 1
      end
    end
    total
  end

  def has_blackjack?
    if @cards.length == 2 and self.total == 21
      true
    else
      false
    end
  end
  
end
  

class Player
  include Hand

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
  include Hand

  attr_accessor :name, :cards

  def initialize (n="Dealer")
  @name = n
  @cards = []
    
  end
# plays
# hits
# stays

end

class Game

  def initialize
    @player_count = 1
    
  end

end

