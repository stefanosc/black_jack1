puts 'Welcome to BlackJack, an awesome card game'
puts 'Please enter your name to begin'

player = gets.chomp
dealer = 'dealer'

puts "welcome #{player} let's play!"

suits = [ 'H', 'D', 'C', 'S' ]
cards = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A' ]

used_cards = []

card = [ suits[rand(suits.length)], cards[rand(cards.length)] ]

while used_cards.include?(card.join())

  card = [ suits[rand(suits.length)], cards[rand(cards.length)] ]
  used_cards << card.join() unless used_cards.include?(card.join())
  return card

end
  

player_cards = []
dealer_cards = []

if player_cards = []
    player_cards << 
    
  end

def count_score card


  
end
