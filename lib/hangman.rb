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
  shuffler.sample
end

def word_length(word)
  word.length
end

def restriction(word_length, string)
  if word_length == string.length
    true
  else
    "Word shouldn't exceed or be below #{word_length}. Thank you!"
  end
end

def word_layout(word_length)
  layout = []
  while word_length.zero? == false
    layout.push('_')
    word_length -= 1
  end
  layout.join(' ')
end

p chosen = comp_choice(dic_array)
p word_length = word_length(chosen)
p restriction(word_length, 'string')
puts word_layout(word_length)
# steps after here:
# shouw the length of word chosen by either computer or man
# restrict the player to the length of words
# represent the word length with hyphens
# any letter chosen, if it is in sync with the position of the chosen word whould appear
# number of chances should'n exceed 5
# if word is gotten before exhausting chances, declare winner
# if word is not gotten and chances exhausted, declare loser



