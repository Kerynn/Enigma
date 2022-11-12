require 'rspec'
require './lib/offsets'

describe Offsets do
  let (:offsets) {Offsets.new}

  it 'exists' do
    expect(offsets).to be_a(Offsets)
  end
  it 'can offset the date' do
    expect(offsets.offset_date('040895')).to eq([1, 0, 2, 5])
  end

  it 'can set the keys' do
    expect(offsets.set_keys('02715')).to eq([02, 27, 71, 15])
  end

  it 'can generate the keys' do
    expect(offsets.generate_keys([02, 27, 71, 15], [1, 0, 2, 5])).to eq({
                A: 3,
                B: 27,
                C: 73,
                D: 20
            })
  end
end
