require 'rspec'
require './lib/random_generator'

describe RandomGenerator do
  let(:random) { Class.new { extend RandomGenerator}}

  it 'has a character set' do
    expect(random.characters).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
      'w', 'x', 'y', 'z', ' '])
  end

  it 'can generate todays date if a key not passed to enigma' do
    expect(random.generate_date).to be_a(String)
    expect(random.generate_date.length).to eq(6)
  end

  it 'can generate a random number if a key not passed to enigma' do
    expect(random.random_num).to be_a(String)
    expect(random.random_num.length).to eq(5)
  end
end
