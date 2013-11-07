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
    "The #{@face_value} of #{@suit}"
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
    ((self.cards.shuffle!).shuffle!).shuffle!
  end

  def deal
    self.cards.pop
  end

end


module Hand


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

  def show_cards

    address_player = "#{@name}, you have" if self.class == Player
    address_player = "The #{@name}, has" if self.class == Dealer
    puts address_player + " the following cards:" 
    puts "-" * 50
    @cards.each {|card| puts card.to_s}
    puts "-" * 50
    puts "The score is: #{self.total}"
    puts
    
  end

  def busted?
    self.total > 21 ? true : false
  end

  def add_card(new_card)
    cards << new_card
  end

  
end
  

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize (n="Player#{@@count}")
    @name = n
    @cards = []
  
  end
end


class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize (n="Dealer")
  @name = n
  @cards = []
    
  end

  def dealer_show_cards

  puts "The #{@name}, has the following cards:"
  puts "-" * 50
  puts "Hidden"
  puts @cards[1].to_s
  puts "-" * 50
  
  end
end


class Blackjack

attr_accessor :player, :deck, :dealer

  def initialize 
    @player = Player.new
    @deck = nil
    @dealer = Dealer.new
    
  end

  def start

    puts "Welcome to Blackjack"
    sleep(0.5)
    # puts "Lets't start, please tell me how many players would like to play"
    puts "Please type your name to begin"
    player.name = gets.chomp
    sleep(0.5)
    puts "Thank you #{player.name}, I am the #{dealer.name} and I will serve you in this game"
    sleep(0.5)




# mix cards
# handle initial dealing for each player and the Dealer
    
  end

  def new_game
    
    puts "Let's Start a new game! I will now prepare and shuffle a new deck the cards"
    self.deck = Deck.new(2)
    self.deck.mix
    20.times do
      print "*" * 30
      sleep(0.1)
    end
    puts "Done, I will deal the cards now"
    2.times {player.add_card(deck.deal)}
    2.times {dealer.add_card(deck.deal)}

  end

  def Blackjack_or_busts?
    
    
  end

  def deal_player

    
    players[0].show_cards

    end


    2.times {dealer.add_card(deck.deal)}


# check total
# check has_blackjack
# ask stay or hit
# check busts

    
  end

  def deal_dealer

    # uncover both cards
    # check total
    # check has_blackjack
    # hits until total < 17
      
  end
    # check busts

  

  def who_wins

    # check each player score against the Dealer
    # say who wins 

    
  end



end

