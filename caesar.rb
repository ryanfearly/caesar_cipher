#Get a message from the user to encrypt
puts "What message would you like to encrypt?"
message = gets.chomp

#Get a shift factor from the user
puts "What shift factor (integers only) would you like to use for encryption?"
shift_factor = gets.chomp.to_i

#Adjust large shift factors
unless shift_factor.between?(-26, 26)
  shift_factor > 26 ? shift_factor %= 26 : shift_factor = -(-shift_factor % 26)
end

def shift_char(char, letter_array, shift_factor)
  new_index = letter_array.index(char) + shift_factor
  if new_index > 25
    new_index -= 26
  elsif new_index < 0
    new_index += 26
  end
    letter_array[new_index]

end

def caesar(message, shift_factor)
  #Data prep
  encrypted_message = []
  upcase_letters = ('A'..'Z').to_a
  lowcase_letters = ('a'..'z').to_a

  #Encryption
  message.split('').each do |char|
    if upcase_letters.index(char)
      encrypted_char = shift_char(char, upcase_letters, shift_factor)
    elsif lowcase_letters.index(char)
      encrypted_char = shift_char(char, lowcase_letters, shift_factor)
    else encrypted_char = char
    end
    encrypted_message.push(encrypted_char)
  end
  puts encrypted_message.join
end

caesar(message, shift_factor)