class Player < ActiveRecord::Base
    attr_reader :name, :gender, :race
    attr_accessor :money


end