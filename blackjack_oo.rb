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
    "#{@face_value} of #{@suit}"
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
    ((cards.shuffle!).shuffle!).shuffle!
  end

  def deal
    cards.pop
  end

end


module Hand


  def total 
    total = 0
    aces = 0
    cards.each do |card|
      if card.face_value.to_i > 0
        total += card.face_value.to_i
      elsif card.face_value == "Ace"
        total += 11
        aces +=1
      else
        total += 10
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

    puts "********* #{@name} cards *********"
    self.cards.each {|card| puts card.to_s}
    puts "-" * 30
    puts "=> Total: #{self.total}"
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

    puts "********* #{@name} cards *********"
    puts "First card hidden"
    puts @cards[1].to_s
    puts "-" * 30
    puts "=> Total: #{self.total}"
    puts
  
  end
end


class Blackjack

attr_accessor :player, :deck, :dealer, :player_count

  def initialize 
    @player = []
    @deck = nil
    @dealer = Dealer.new
    @player_count = 0
    
  end

  def first_launch
    puts "Welcome to Blackjack"
    sleep(0.5)
    puts "Let's create a new game, how many players would like to play?"
    self.player_count = gets.chomp.to_i
    
  end

  def create_players

    player_count.times do |i|
      self.player << Player.new("Player#{i+1}")
    end
    
  end

  def set_names
    player_count == 1 ? (puts "Please type your name to begin") : (puts "Please type the name for each player")
    player.each do |player|
      puts "New name for #{player.name}:"
      player.name = gets.chomp
      puts "Welcome #{player.name}"
      puts "-----------------"
    end
    
  end

  def prepare_deck # and clear the cards array for dealer and player(s)
    
    self.deck = Deck.new(player_count / 2) # always make sure there are enough cards based on player_count
    player.each {|player| player.cards = [] }
    dealer.cards = []


    deck.mix
    puts "The Dealer is now preparing a new deck of cards  "
    15.times do
      print "*"
      sleep(0.07)
    end
    print " OK, done!"
    puts

  end

  def initial_deal

    puts
    puts
    puts "The dealer is now dealing the cards"
    puts
    2.times do
      player.each {|player| player.add_card(deck.deal) }
      dealer.add_card(deck.deal)
    end
    
  end

  def blackjack_or_busts? dealer_or_player

      if dealer_or_player.has_blackjack?
        puts "Congratulations #{dealer_or_player.name}, you win this game!" if dealer_or_player.is_a?(Player)
        puts "Sorry, you loose this game #{dealer_or_player.name}! The dealer just hit Blackjack" if dealer_or_player.is_a?(Dealer)
        puts
        # play_again?
      end

      if dealer_or_player.busted? #TODO insert all players names when dealer busts
        puts "The Dealer busted. Congratulations, you win this game!" if dealer_or_player.is_a?(Dealer)
        puts "Sorry, you loose this game #{dealer_or_player.name}! You busted" if dealer_or_player.is_a?(Player)
        puts
      end
    
  end

  def deal_player
  
    player.each do |player|

      blackjack_or_busts?(player)

      while !player.busted?
        puts "#{player.name}, would you like to hit or stay? type: 1 to hit or, type: 2 to stay"
        hit_or_stay = gets.chomp
        
        if !['1', '2'].include?(hit_or_stay)
          puts "Error: you must enter 1 or 2"
          next
        end
        
        if hit_or_stay == "2"
          puts "You decided to stay with #{player.total}"
          puts
          break
        else
          player.add_card(deck.deal)
          last = player.cards.last
          puts "The dealer is dealing you:"
          puts " => #{last}"
          puts
          puts "Your new total is:"
          puts " => #{player.total}"
          puts
          blackjack_or_busts?(player)
        end

      end
    end
  end

  def deal_dealer

    dealer.show_cards
    blackjack_or_busts?(dealer)
    
    all_busted = false
    player.each do |player| 
      if !player.busted?
        all_busted = false
        break
      else
        all_busted = true
      end
    end 

    unless all_busted

      while dealer.total < 17
         
         dealer.add_card(deck.deal)
         puts "dealing the dealer #{dealer.cards.last}"
         sleep (0.5)
         puts "The dealer total is #{dealer.total}"       
         sleep (0.8)
         puts
         blackjack_or_busts?(dealer)
      end 
      puts "The dealer decided to stay with #{dealer.total}" if !dealer.busted?  
    end

  end
  

  def who_wins

    if !dealer.busted?
      player.each do |player|
        if !player.busted?
          puts "Congratulations #{player.name}, you win" if player.total > dealer.total
          puts "I am sorry #{player.name}, you lost" if dealer.total >= player.total
        end
      end
    end
    
 
    # check each player score against the Dealer    
  end


  def play_again?
    
    puts "Would you like to play another game?"
    puts "type: 1 if you would like to play"
    puts "type: 0 if you would like to exit"
    play_or_exit = gets.chomp.to_s
    if play_or_exit == "0"
      "Thank you for playing it was fun! See you soon, Goodbye"
    elsif play_or_exit == "1"
      replay
    end
  end

  def play
    first_launch
    create_players
    set_names
    prepare_deck
    initial_deal
    player.each { |pl| pl.show_cards}
    dealer.dealer_show_cards
    deal_player
    deal_dealer
    who_wins
    play_again?
    
  end

  def replay
    prepare_deck
    initial_deal
    player.each { |pl| pl.show_cards}
    dealer.dealer_show_cards
    deal_player
    deal_dealer
    who_wins
    play_again?
    
  end


end

blackjack = Blackjack.new
blackjack.play