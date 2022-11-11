require 'date'

class Enigma

  def characters
    ('a'..'z').to_a << ' '
  end

  def generate_date
    Date.today.strftime('%d%m%y')
  end

  def encrypt(message, key, date)
    encrypt_hash = {}
    encrypt_hash[:encryption] = message #encrypted message, method
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  # def offset(date)
  #   off_date = date.to_i
  #   squared_date = off_date * off_date
  #
  # end
end
