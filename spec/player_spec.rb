require_relative "../lib/player.rb"
require_relative "../lib/game.rb"

describe "Player class" do
  it "should instanciate player" do
    player = Player.new("Josiane")
  end

  player = Player.new("Josiane")

  it "should have 10 hp at init" do
    expect(player.life_points).to eq(10)
  end

  player2 = Player.new("José")

  it "should attack properly" do
    player.attacks(player2)
    expect(player2.life_points).not_to eq(10)
  end
end