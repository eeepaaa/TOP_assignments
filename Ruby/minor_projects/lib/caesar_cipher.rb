# frozen_string_literal: false

# Ciphers messages
class CaesarCipher
  def caesar_cipher(string = 'Hello!', shift = 0)
    return raise 'Shift value cannot be greater than 25!' if shift > 25
    raise 'Shift value cannot be less than -25!' if shift < -25

    shift += 26 if shift.negative?
    letters = 'abcdefghijklmnopqrstuvwxyz'.split('')
    new_string = ''

    string.split('').each do |e|
      if letters.include?(e)
        e_index = letters.index(e) + shift
        e_index -= 26 if e_index > 25
        new_string += letters[e_index]

      elsif letters.include?(e.downcase)
        e_index = letters.index(e.downcase) + shift
        e_index -= 26 if e_index > 25
        new_string += letters[e_index].upcase
      else
        new_string += e
      end
    end
    new_string
  end
end
