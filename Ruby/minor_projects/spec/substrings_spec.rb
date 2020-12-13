# frozen_string_literal: false

require './substrings'

describe SubStrings do
  let(:dictionary) do
    @dictionary = %w[below down go going horn how howdy \
                     it i own part partner sit low]
  end

  it 'matches one word' do
    expected = { 'below' => 1, 'low' => 1 }
    expect(subject.substrings('below', dictionary)).to eql(expected)
  end

  it 'matches multiple words' do
    expected = { 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2,
                 'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1,
                 'part' => 1, 'partner' => 1, 'sit' => 1 }
    expect(subject.substrings("Howdy partner, sit down! How's it going?", dictionary)).to eql(expected)
  end
end
