puts 'Welcome to BlackJack, an awesome card game'
puts 'Please enter your name to begin'

player = gets.chomp
dealer = 'dealer'

puts "welcome #{player} let's play!"

suits = [ 'H', 'D', 'C', 'S' ]
cards = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A' ]

used_cards = []



def generate_card suits, cards

  card = [ suits[rand(suits.length)], cards[rand(cards.length)] ]
  
  if used_cards.include?(card.join())
    generate_card suits, cards 
  end

  used_cards << card.join()

  
end
  

player_cards = []
dealer_cards = []

if player_cards = []
    player_cards << 
    
  end

def count_score card


  
end
