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

  it 'can generate todays date if a key not passed to enigma' do
    # todays_date = Date.new(2018, 8, 4)
    # allow(todays_date).to receive(:generate_date).and_return('040818')
    expect(enigma.generate_date).to be_a(String)
    expect(enigma.generate_date.length).to eq(6)
  end

  it 'can generate a random number if a key not passed to enigma' do
    # allow(enigma).to receive(:random_num).and_return('71812')
    expect(enigma.random_num).to be_a(String)
    expect(enigma.random_num.length).to eq(5)
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

  it 'can set the keys' do
    expect(enigma.set_keys('02715')).to eq([02, 27, 71, 15])
  end

  it 'can generate the keys' do
    expect(enigma.generate_keys([02, 27, 71, 15], [1, 0, 2, 5])).to eq({
                A: 3,
                B: 27,
                C: 73,
                D: 20
            })
  end

  xit 'can create an array of the message characters for each key' do
    expect(enigma.key_arrays('hello', {A: 3, B: 5, C: 1, D: 2})).to eq([[['h', 'o'], 3], [['e'], 5], [['l'], 1]], [['l'], 2])
  end

  xit 'can change the message to be encrypted' do
    expect(enigma.shift_message('hello there', {A: 3, B: 5, C: 1, D: 2})).to eq('kjmnreujhwf')
  end

  xit 'can encrypt a message with a key and date' do
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq({
              encryption: 'keder ohulw',
              key: '02715',
              date: '040895'
          })
  end
end
