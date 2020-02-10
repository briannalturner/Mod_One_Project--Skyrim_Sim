class Quest < ActiveRecord::Base
    attr_reader :description, :reward, :goodwill, :town_id
    
end