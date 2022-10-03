# frozen_string_literal: true

dictionary = File.read('google-10000-english-no-swears.txt')

dic_array = dictionary.split(' ')

def chosen_words(array)
  chosen = []
  array.each do |word|
    if word.length >= 5 || word.length <= 12
      chosen.push(word)
    end
  end
  chosen
end

def randomize(array)
  array.shuffle
end

def comp_choice(array)
  words = chosen_words(array)
  shuffler = randomize(words)
  word = shuffler.sample
  word.split('')
end

def word_length(array)
  array.length
end

def restriction(word_length, array)
  if word_length == array.length
    true
  end
end

# restriction(5, ['string'])

def word_layout(word_length)
  layout = []
  while word_length.zero? == false
    layout.push('_')
    word_length -= 1
  end
  layout.join(' ')
end

def splitting(word)
  word.split(' ')
end

def joining(split)
  split.join('')
end

def player_move
  move = gets.chomp
  move.split('')
end

array = chosen_words(dic_array)

# determine winning
def game(array)
  comp_choice = comp_choice(array)
  word_length = word_length(comp_choice)
  dashes = word_layout(word_length)
  layout = splitting(dashes)
  move_count = 5
  while move_count.zero? == false
    puts layout.join(' ')
    puts'Guess a word!'
    move_count -= 1
    my_word = player_move.map { |word| word }
    if my_word == comp_choice
      puts "You win!"
      return
    end

    if restriction(word_length, my_word) == true
      my_word.each_with_index do |letter, index|
        comp_choice.each_with_index do |letter1, index1|
          layout.each_with_index do |position, index2|
            if letter == letter1 && index == index1 && index1 == index2
              layout[index2] = letter
            end
          end
        end
      end
    else
      puts "Word length should not exceed of fall short of #{word_length}"
    end
    puts "You have #{move_count} moves to go!"
    if move_count.zero?
      puts "You lose! The word is \"#{comp_choice.join('')}\""
    end
  end
end

p game(array)

# p chosen = comp_choice(dic_array)
# p word_length = word_length(chosen)
# p restriction(word_length, 'string')
# puts word_layout(word_length)
# steps after here:
# --shouw the length of word chosen by either computer or man
# --restrict the player to the length of words
# --represent the word length with hyphens
# --any letter chosen, if it is in sync with the position of the chosen word whould appear
# ---number of chances should'n exceed 5
# --if word is gotten before exhausting chances, declare winner
# --if word is not gotten and chances exhausted, declare loser
