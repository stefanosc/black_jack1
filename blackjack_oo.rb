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

  def initialize (num_decks=2)
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

    address_player = "#{@name}, you have" if self.is_a?(Player)
    address_player = "The #{@name}, has" if self.is_a?(Dealer)
    puts address_player + " the following cards:" 
    puts "-" * 50
    @cards.each {|card| puts card.to_s}
    puts "-" * 50
    puts
    
  end

  def busted?
    total > 21
  end

  def add_card(new_card)
    cards << new_card
  end

  
end
  

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize (n="Player")
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
    puts "First card hidden, until dealer turn"
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
    self.player.name = gets.chomp
    sleep(0.5)
    puts "Thank you #{player.name}, I am the #{dealer.name} and I will serve you in this game"
    sleep(0.5)

    # mix cards
    # handle initial dealing for each player and the Dealer
    
  end

  def new_game
    
    puts "Let's Start a new game! I will now prepare and shuffle a new deck the cards"
    self.deck = Deck.new(2)
    deck.mix
    20.times do
      print "*"
      sleep(0.2)
    end
    puts
    puts "Done, I will deal the cards now"
    2.times {player.add_card(deck.deal)}
    2.times {dealer.add_card(deck.deal)}

  end

  def blackjack_or_busts? dealer_or_player
    if dealer_or_player.has_blackjack?
      puts "Congratulations #{player.name}, you win this game!" if dealer_or_player.is_a?(Player)
      puts "Sorry, you loose this game #{player.name}! The dealer just hit Blackjack" if dealer_or_player.is_a?(Dealer)
      dealer_or_player.show_cards
      play_again?
    end

    if dealer_or_player.busted?
      puts "The Dealer busted. Congratulations #{player.name}, you win this game!" if dealer_or_player.is_a?(Dealer)
      puts "Sorry, you loose this game #{player.name}! You busted" if dealer_or_player.is_a?(Player)
      dealer_or_player.show_cards
      play_again?
    end

    
  end

  def deal_player

    hit_or_stay = "1"
      puts "Your score is #{self.total}"
  
    while !player.busted?
      puts "#{player.name}, would you like to hit or stay? type: 1 to hit or, type: 2 to stay"
      hit_or_stay = gets.chomp
      
      if hit_or_stay !['1', '2']
        puts "please only type numbers: 1 or 2"
        next
      end
      
      if hit_or_stay == "2"
        puts "You decided to stay with:"
        player.show_cards
        puts "your total is #{player.total}"
      else
        player.add_card(deck.deal)
        puts "Your cards are"
        player.show_cards
        blackjack_or_busts?(player)
      end

    end
  end

  def deal_dealer

    dealer.show_cards
    blackjack_or_busts?(dealer)
    puts "The dealer total is #{dealer.total}"
    while dealer.total < 17
       dealer.add_card(deck.deal)
       sleep (0.5)
       dealer.show_cards
       sleep (0.5)
       blackjack_or_busts?(dealer)
       puts "The dealer total is #{dealer.total}"
    end 
  end
  

  def who_wins

    puts "Congratulations #{player.name}, you win" if player.total > dealer.total
    puts "I am sorry #{player.name}, you lost" if dealer.total >= player.total
    play_again?
    # check each player score against the Dealer    
  end


  def play_again?
    
    puts "Would you like to play another game?"
    puts "type: 1 if you would like to play"
    puts "type: 0 if you would like to exit"
    play_or_exit = gets.chomp
    if play_or_exit == "0"
      "Thank you for playing it was fun! See you soon, Goodbye"
    elsif play_or_exit == "1"
      play
    end
  end

  def play
    new_game
    player.show_cards
    blackjack_or_busts?(player)
    dealer.dealer_show_cards
    deal_player
    deal_dealer
    who_wins
    play_again?

    
  end


end

blackjack = Blackjack.new
blackjack.start
blackjack.play