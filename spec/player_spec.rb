require 'player'

describe "Player class" do

  subject(:sam) {Player.new('sam')}

  it 'responds to name' do
    expect(sam.name).to eq 'sam'
  end
end
