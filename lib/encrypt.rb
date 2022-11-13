require_relative 'enigma'
require_relative 'random_generator'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")

incoming_msg = handle.read
handle.close

encrypted = enigma.encrypt(incoming_msg)

writer = File.open(ARGV[1], "w")
writer.write(encrypted[:encryption])
writer.close

p "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}"
