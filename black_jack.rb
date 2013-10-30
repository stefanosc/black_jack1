puts 'Welcome to BlackJack, an awesome card game'
puts 'Please enter your name to begin'

player = gets.chomp
dealer = 'dealer'

puts "welcome #{player} let's play!"

suits = [ 'H', 'D', 'C', 'S' ]
cards = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A' ]

deck = suits.product(cards)

player_cards = []
dealer_cards = []

def pick_card deck

  card = deck[rand(deck.length)]
  
    
end



# def generate_card suits, cards

#   card = [ suits[rand(suits.length)], cards[rand(cards.length)] ]
    
# end

# card = generate_card(suits, cards)

# while used_cards.include?(card.join())
#   generate_card suits, cards 
# end

# used_cards << card.join()





# if player_cards = []
#     player_cards << 
    
#   end

def count_score card


  
end
