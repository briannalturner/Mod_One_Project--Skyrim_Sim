require 'rspec'
require_relative '../config/environment.rb'

describe "Player" do

    let (:bri) {Player.new(name: "Bri", gender: "female", race: "Khajiit", money: 0, location: 64)}

    it "Player.name returns player name" do
        expect(bri.name).to eq "Bri"
    end

    it "Player.gender returns player gender" do
        expect(bri.gender).to eq "female"
    end

    it "Player.race returns player race" do
        expect(bri.race).to eq "Khajiit"
    end

    it "Player.money returns player money" do
        expect(bri.money).to eq 0
    end

    it "Player.location returns player location" do
        expect(bri.location).to eq 64
    end

end