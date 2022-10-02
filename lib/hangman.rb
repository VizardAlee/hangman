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

p comp_choice(dic_array)

# steps after here:
# shouw the length of word chosen by either computer or man
# restrict the player to the length of words
# represent the word length with hyphens
# any letter chosen, if it is in sync with the position of the chosen word whould appear
# number of chances should'n exceed 5
# if word is gotten before exhausting chances, declare winner
# if word is not gotten and chances exhausted, declare loser