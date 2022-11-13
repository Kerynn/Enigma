require_relative 'enigma'
require_relative 'random_generator'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")

msg_to_decrypt = handle.read
handle.close

decrypted = enigma.decrypt(msg_to_decrypt, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(decrypted[:decryption])
writer.close

p "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
