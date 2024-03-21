# Set constants to map alphabet
ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.chars
CAPITALIZED_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.chars

def caesar_cipher(phrase, shift_factor)
  # Iterate over chars phrase
  phrase.chars.map do |char|
    if must_convert?(char)
      convert_char(char, shift_factor)
    else
      char
    end
  end.join
end

# Find index on alphabet array
def find_corresponding_index(char, shift_factor, alphabet)
  index = alphabet.find_index(char) + shift_factor.to_i
  index = index % 26 if index > 25
  index
end

# Convert char using the shift factor
def convert_char(char, shift_factor)
  alphabet = upcase_char?(char) ? CAPITALIZED_ALPHABET : ALPHABET
  alphabet.at(find_corresponding_index(char, shift_factor, alphabet))
end

# Verify if must convert char (must not convert symbols)
def must_convert?(char)
  ALPHABET.include?(char) || CAPITALIZED_ALPHABET.include?(char)
end

# Verify if char is upcase
def upcase_char?(char)
  char.upcase.eql?(char)
end

# Interact with user and get data
puts 'Enter your phrase to encrypt:'
phrase = gets.chomp!
puts 'Enter the shift factor:'
factor = gets.chomp!
puts caesar_cipher(phrase, factor)

