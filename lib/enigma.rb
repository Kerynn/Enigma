require 'date'

class Enigma

  def characters
    ('a'..'z').to_a << ' '
  end

  def generate_date
    Date.today.strftime('%d%m%y')
  end

  def random_num
    rand(00000...99999).to_s
  end

  def encrypt(message, key = random_num, date = generate_date)
    first_key = set_keys(key)
    offset_date = offset(date)
    final_keys = generate_keys(first_key, offset_date)
    encrypt_hash = {}
    encrypt_hash[:encryption] = shift_message(message, final_keys)
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  def split_msg(message)
    message.split('')
  end

  def offset(date)
    integer_date = date.to_i
    squared_date = integer_date * integer_date
    final_four = squared_date.to_s[-4..-1]
    split_strings = final_four.split('')
    offsets = split_strings.map do |num|
      num.to_i
    end
  end

  def set_keys(key)
    key_array = []
    key_array << key[0..1].to_i
    key_array << key[1..2].to_i
    key_array << key[2..3].to_i
    key_array << key[3..4].to_i
    key_array
  end

  def generate_keys(keys, offset)
    key_hash = Hash.new(0)
    key_hash[:A] = keys[0] + offset[0]
    key_hash[:B] = keys[1] + offset[1]
    key_hash[:C] = keys[2] + offset[2]
    key_hash[:D] = keys[3] + offset[3]
    key_hash
  end

  def key_arrays(message, keys)
    msg_array = split_msg(message)
    a_array = []
    b_array = []
    c_array = []
    d_array = []
    until msg_array.empty? do
      a_array << msg_array[0]
      b_array << msg_array[1] if msg_array[1]
      c_array << msg_array[2] if msg_array[2]
      d_array << msg_array[3] if msg_array[3]
      msg_array.shift(4)
    end
    keys_array = [[a_array, keys[:A]], [b_array, keys[:B]], [c_array, keys[:C]], [d_array, keys[:D]]]
  end

  def shifted_characters(message, keys)
    array_to_shift = key_arrays(message, keys)
    final = array_to_shift.map do |msg_char, value|
      msg_char.map do |char|
      indexed_position = (characters.find_index(char) + value)
      characters[indexed_position]
    end
  end

  def shift_message(message, keys)
    final_chars = shifted_characters(message, keys)
    string_char = ''
      until final_chars.join.empty? do
        final_chars.map.with_index do |shift_char, index|
          string_char << shift_char[0] if shift_char[0]
          shift_char.shift
         end
      end
      string_char
    end
  end

  # def shift_message(message, keys)
  #   msg_array = split_msg(message)
  #   a_array = []
  #   b_array = []
  #   c_array = []
  #   d_array = []
  #   until msg_array.empty? do
  #     a_array << msg_array[0]
  #     b_array << msg_array[1] if msg_array[1]
  #     c_array << msg_array[2] if msg_array[2]
  #     d_array << msg_array[3] if msg_array[3]
  #     msg_array.shift(4)
  #   end
  #   keys_array = [[a_array, keys[:A]], [b_array, keys[:B]], [c_array, keys[:C]], [d_array, keys[:D]]]
  #   final = keys_array.map do |msg_char, value|
  #     msg_char.map do |char|
  #     indexed_position = (characters.find_index(char) + value)
  #     characters[indexed_position]
  #   end
  # end
  # string_char = ''
  #   until final.join.empty? do
  #     final.map.with_index do |shift_char, index|
  #       string_char << shift_char[0] if shift_char[0]
  #       shift_char.shift
  #      end
  #   end
  #   string_char
  # end
end
