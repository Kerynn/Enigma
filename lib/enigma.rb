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

  def decrypt(encrypt_message, key = random_num, date = generate_date)
    first_key = set_keys(key)
    offset_date = offset(date)
    final_keys = generate_keys(first_key, offset_date)
    encrypt_hash = {}
    encrypt_hash[:decryption] = unshift_message(encrypt_message, final_keys)
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

  def converted_char(char, key_value)
    indexed_position = (characters.find_index(char) + key_value)
    if indexed_position > 26
      large_chars = characters * 10
      large_chars[indexed_position]
    else
      characters[indexed_position]
    end
  end

  def shift_message(message, keys)
    msg_array = split_msg(message)
    msg_string = ''
    until msg_array.empty? do
      msg_string << converted_char(msg_array[0], keys[:A])
      msg_string << converted_char(msg_array[1], keys[:B]) if msg_array[1]
      msg_string << converted_char(msg_array[2], keys[:C]) if msg_array[2]
      msg_string << converted_char(msg_array[3], keys[:D]) if msg_array[3]
      msg_array.shift(4)
    end
    msg_string
  end

  def reconvert_char(char, key_value)
    indexed_position = (characters.find_index(char) - key_value)
      large_chars = characters * 10
      large_chars[indexed_position]
  end

  def unshift_message(encrypt_message, keys)
    msg_array = split_msg(encrypt_message)
    msg_string = ''
    until msg_array.empty? do
      msg_string << reconvert_char(msg_array[0], keys[:A])
      msg_string << reconvert_char(msg_array[1], keys[:B]) if msg_array[1]
      msg_string << reconvert_char(msg_array[2], keys[:C]) if msg_array[2]
      msg_string << reconvert_char(msg_array[3], keys[:D]) if msg_array[3]
      msg_array.shift(4)
    end
    msg_string
  end
end
