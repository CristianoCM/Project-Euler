=begin
High Card: Highest value card.
One Pair: Two cards of the same value.
Two Pairs: Two different pairs.
Three of a Kind: Three cards of the same value.
Straight: All cards are consecutive values.
Flush: All cards of the same suit.
Full House: Three of a kind and a pair.
Four of a Kind: Four cards of the same value.
Straight Flush: All cards are consecutive values of same suit.
Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

Problem 54 - Poker Hands
=end

def getScore(hand_n, hand_s)

  hand_n_sorted = hand_n.sort
  hand_n_combos = hand_n.select{|e| hand_n.count(e) > 1 }
  
  if hand_s.uniq.size == 1
    # Flush
    if hand_n_sorted == (hand_n_sorted.first..hand_n_sorted.last).to_a
      # Straight Flush
      if hand_n_sorted.first == 10
        # Royal Flush
        return $games["Royal Flush"]
      else
        return $games["Straight Flush"]
      end
    end
    return $games["Flush"]
  elsif hand_n_sorted == (hand_n_sorted.first..hand_n_sorted.last).to_a
    # Straight
    return $games["Straight"]
  elsif !hand_n_combos.empty?
    hand_n_combos_size = hand_n_combos.size
    case hand_n_combos_size
    when 5
      return $games["Full House"]
    when 4
      return $games["Four of a Kind"] if hand_n_combos.uniq.size == 1
      return $games["Two Pairs"]
    when 3
      return $games["Three of a Kind"]
    when 2
      return $games["One Pair"]
    else
      return 0
    end
  else
    return $games["High Card"]
  end
  
end

def getWinner(player1_score, player1_hc, hand1_n, player2_score, player2_hc, hand2_n)
  
  w = 4
  
  if player1_score == player2_score
  
    case player1_score
    when 10
      w = 4 # DRAW
    when 9, 5
      w = player1_hc > player2_hc ? 1 : player1_hc < player2_hc ? 2 : 4
    when 8, 7, 4 # Impossible to draw
      w = player1_hc > player2_hc ? 1 : 2
    when 6, 1
      i = 4
      5.times{
        if player1_hc[i] == player2_hc[i]
          i -= 1
        else
          w = player1_hc[i] > player2_hc[i] ? 1 : 2
        end
      }
      w = 4 if w == 0
    when 3
      if player1_hc[0] == player2_hc[0]
        if player1_hc[1] == player2_hc[1]
          left1 = hand1_n - player1_hc
          left2 = hand2_n - player2_hc
          w = left1 > left2 ? 1 : left1 < left2 ? 2 : 4
        else
          w = player1_hc[1] > player2_hc[1] ? 1 : 2
        end
      else
        w = player1_hc[0] > player2_hc[0] ? 1 : 2
      end
    when 2
      if player1_hc == player2_hc
        left1 = (hand1_n - [player1_hc]).sort
        left2 = (hand2_n - [player2_hc]).sort
        i = 2
        3.times{
          if left1[i] == left2[i]
            i -= 1
          else
            w = left1[i] > left2[i] ? 1 : 2
          end
        }
        w = 4 if w == 0
      else
        w = player1_hc > player2_hc ? 1 : 2
      end
    end
    
  end
  
  if player1_score > player2_score
    w = 1
  elsif player1_score < player2_score
    w = 2
  end
  
  return w
  
end

def getDominantCardByGame(hand_n, game)
  
  case game
  when 9
    hand_n_sorted = hand_n.sort
    return hand_n_sorted.first
  when 8
    hand_n_combos = hand_n.select{|e| hand_n.count(e) > 1 }
    return hand_n_combos.first
  when 7
    hand_n_combos = hand_n.select{|e| hand_n.count(e) > 1 }
    three = hand_n_combos.count(hand_n_combos.first) == 3 ? hand_n_combos.first : hand_n_combos.last
    return three
  when 6
    hand_n_sorted = hand_n.sort
    return hand_n_sorted
  when 5
    hand_n_sorted = hand_n.sort
    return hand_n_sorted.first
  when 4
    hand_n_combos = hand_n.select{|e| hand_n.count(e) > 1 }
    return hand_n_combos.first
  when 3
    hand_n_combos = hand_n.select{|e| hand_n.count(e) > 1 }
    return [hand_n_combos.max, hand_n_combos.min]
  when 2
    hand_n_combos = hand_n.select{|e| hand_n.count(e) > 1 }
    return hand_n_combos.first
  when 1
    hand_n_sorted = hand_n.sort
    return hand_n_sorted
  else
    return nil
  end
  
end

high_cards = {"T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}
$games = {"High Card" => 1, "One Pair" => 2, "Two Pairs" => 3, "Three of a Kind" => 4, "Straight" => 5, "Flush" => 6, "Full House" => 7, "Four of a Kind" => 8, "Straight Flush" => 9, "Royal Flush" => 10}

player1_victories = 0
player2_victories = 0
draws = 0

File.open("C:\\Ruby Files\\problem54_poker.txt", "r") do |f|
  f.each_line do |line|
    hand1 = line[0..14].split(" ")
    hand2 = line[15..31].split(" ")

    hand1_n = hand1.map{|z| (high_cards[z[0]] == nil) ? z[0].to_i : high_cards[z[0]].to_i }
    hand2_n = hand2.map{|z| (high_cards[z[0]] == nil) ? z[0].to_i : high_cards[z[0]].to_i }

    hand1_s = hand1.map{|z| z[1] }
    hand2_s = hand2.map{|z| z[1] }

    player1_score = 0
    player2_score = 0

    player1_hc = 0
    player2_hc = 0    

    # PLAYER 1
    player1_score = getScore(hand1_n, hand1_s)
    player1_hc = getDominantCardByGame(hand1_n, player1_score)

    # PLAYER 2
    player2_score = getScore(hand2_n, hand2_s)
    player2_hc = getDominantCardByGame(hand2_n, player2_score)

    # BATTLE
    winner = getWinner(player1_score, player1_hc, hand1_n, player2_score, player2_hc, hand2_n)
    if winner == 1
      player1_victories += 1
    elsif winner == 2
      player2_victories += 1
    else
      draws += 1
    end
  end
end

p "PLAYER 1 VICTORIES = " + player1_victories.to_s, "PLAYER 2 VICTORIES = " + player2_victories.to_s, "DRAWS = " + draws.to_s