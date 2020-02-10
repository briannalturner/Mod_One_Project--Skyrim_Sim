class Relationship < ActiveRecord::Base
    attr_reader :player_id, :town_id
    attr_accessor :bounty, :thanehood, :goodwill, :home
    
end