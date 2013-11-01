puts 'Welcome to BlackJack, an awesome card game'
puts 'Please enter your name to begin'

player = gets.chomp
dealer = 'dealer'

puts "welcome #{player} let's play!"

suits = [ 'H', 'D', 'C', 'S' ]
cards = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A' ]
deck = []

player_score = 0
dealer_score = 0
blackjack = 0
player_wins = 0
dealer_wins = 0

def serve_card deck

  deck = deck.shuffle!
  deck.pop
  
end

def count_score cards
  total = 0
  aces = 0
  cards.each do |v|

    if v[1].to_i > 0
      total += v[1].to_i
    elsif v[1] == 'J' || v[1] == 'Q' || v[1] == 'K'
      total += 10
    elsif v[1] == 'A'
      aces += 1
      total += 11
    end
  end
  
  while total > 21 and aces > 0
      aces -= 1
      total -= 10
  end 
  total
end

while true
  if deck.length < 40
    deck = ((suits.product(cards)) + (suits.product(cards))).shuffle
  end

  player_cards = []
  dealer_cards = []
  
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
  # check if the player has blackJack
  if player_score == 21 and player_cards.length == 2
    puts "Cool that is an awesome BlackJack!"
    blackjack = 1
  end
  puts "would you like to stay or hit? type 'stay' or simply enter to hit again"
  hit_stay = gets.chomp

  while hit_stay != "stay"
    player_cards << serve_card(deck)
    player_score = count_score(player_cards) 

    if player_score > 21
      puts player_cards.join(' ')
      puts "Sorry you lose, your score is: #{player_score} !!"
      dealer_wins += 1
      break 
    end
    puts "#{player} you have been served and your new cards are"
    puts player_cards.join(' ')
    puts "your score is #{player_score}"
    puts "'stay' or 'hit'?"
    hit_stay = gets.chomp
  end

  if player_score <= 21

    puts "-" * 50
    puts "the #{dealer} cards are"
    puts dealer_cards.join(' ')
    puts "the dealer score is #{dealer_score}"

    while dealer_score < 17
      dealer_cards << serve_card(deck)
      dealer_score = count_score(dealer_cards)
      
      if dealer_score > 21
        puts "the dealer busted! Her score is: #{dealer_score} !!"
        player_wins += 1
        break
      else  
      puts "the #{dealer} just hit and her new cards are"
      puts dealer_cards.join(' ')
      puts "the dealer score is #{dealer_score}"
      end
      dealer_score
    end

    if dealer_score >= player_score and dealer_score < 22 and blackjack == 0
      puts "the #{dealer} wins"
      dealer_wins += 1
    elsif dealer_score < player_score 
      player_wins += 1
      puts "you win!"
    end

  end

  puts "-" * 50
  puts "you have #{player_wins} wins"
  puts "the dealer has #{dealer_wins} wins"
  puts "would you like to play again? enter to play or type 'no' to exit"

  play_again = gets.chomp
  if play_again == 'no'
    break
  end

end