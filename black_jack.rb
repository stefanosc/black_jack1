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
player_wins = 0
dealer_wins = 0

def serve_card deck

  deck = deck.shuffle!
  deck.pop
  
end

def count_score cards
  cards.each { |v|
    total = 0
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

while true
  2.times do
    player_cards << serve_card(deck)
    dealer_cards << serve_card(deck)
  end

  player_score = count_score(player_cards)
  dealer_score = count_score(dealer_cards)

  puts "#{player} you have been served the following cards"
  puts player_cards.join(' ')
  puts "your score is #{player_score}"
  puts ' '
  puts "the #{dealer} cards are"
  puts dealer_cards.join(' ')
  puts "the dealer score is #{dealer_score}"

  input = gets.chomp
  if input == ''
    break
  end

end


# c = serve_card(deck)


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

