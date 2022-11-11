class Enigma

  def characters
    ('a'..'z').to_a << ' '
  end

  def encrypt(message, key, date)
    encrypt_hash = {}
    encrypt_hash[:encryption] = message #encrypted message, method
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end
end
