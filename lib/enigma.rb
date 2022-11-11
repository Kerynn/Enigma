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
    encrypt_hash = {}
    encrypt_hash[:encryption] = message #encrypted message, method
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  def split_msg(message)
    message.split('')
  end

  def offset(date)
    off_date = date.to_i
    squared_date = off_date * off_date
    final_four = squared_date.to_s[-4..-1]
    split_strings = final_four.split('')
    offsets = split_strings.map do |num|
      num.to_i
    end
    offsets
  end

  def set_keys(key)
    key_hash = {}
    key_hash[:A] = key[0..1].to_i
    key_hash[:B] = key[1..2].to_i
    key_hash[:C] = key[2..3].to_i
    key_hash[:D] = key[3..4].to_i
    key_hash
  end
end
