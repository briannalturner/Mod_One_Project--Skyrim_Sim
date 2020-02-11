class Npc < ActiveRecord::Base
    belongs_to :towns
    has_many :interactions
end