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
player_score = 0
dealer_score = 0

def serve_card deck

  deck = deck.shuffle!
  deck.pop
  
end

def count_score cards
  cards.each { |v|
    if v[1].to_i > 0
      total += v[1].to_i
    elsif v[1] == 'J' || v[1] == 'Q' || v[1] == 'K'
      total += 10
    elsif v[1] == 'A'
      aces += 1
      total += 11
    end
  }
  while total > 21
    if aces > 0
      aces -= 1
      total -= 10
    end 
  end 
end



c = serve_card(deck)




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
