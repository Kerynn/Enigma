require './spec/spec_helper'
require './lib/enigma'

RSpec.describe Enigma do
  let (:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'has a character set' do
    expect(enigma.characters).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
      'w', 'x', 'y', 'z', ' '])
  end

  it 'can generate todays date' do
    todays_date = Date.new(2018, 8, 4)
    allow(todays_date).to receive(:generate_date).and_return('040818')
  end

  it 'can generate a random number for a key' do
    allow(enigma).to receive(:generate_key).and_return(71812)
  end

  it 'can encrypt a message without a date' do
    todays_date = Date.new(2018, 8, 4)
    allow(todays_date).to receive(:encrypt).and_return({
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: '040818'
            })
  end

  it 'can offset the date' do
    expect(enigma.offset('040895')).to eq([1, 0, 2, 5])
  end

  it 'can split a message into individual strings' do
    expect(enigma.split_msg('hey there')).to eq(['h', 'e', 'y', ' ', 't', 'h', 'e', 'r', 'e'])
  end

  xit 'can encrypt a message with a key and date' do
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq({
              encryption: 'keder ohulw',
              key: '02715',
              date: '040895'
          })
  end
end
