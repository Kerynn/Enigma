require 'date'

class Enigma

  def characters
    ('a'..'z').to_a << ' '
  end

  def generate_date
    Date.today.strftime('%d%m%y')
  end

  def generate_key
    rand(00000...99999)
  end

  def encrypt(message, key = generate_key, date = generate_date)
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
end
