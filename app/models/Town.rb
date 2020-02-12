class Town < ActiveRecord::Base
    has_many :relationships
    has_many :players, through: :relationships
    has_many :npcs
    has_many :interactions, through: :npcs
    has_many :quests

    #currently we are looking at a Town instance with keys id:, name:, jarl:
    #Npc instance has id:, description:, town_id:, name:
    #We need self.id == Npc.town_id

    #returns NPC instances in town that is calling this.
    def get_npcs_for_city
        Npc.all.select {|npc| self.id == npc.town_id} 
    end

    #We have to go through all interactions... and find the npc_id associated with that interaction.
    def get_interactions_for_city
        self.get_npcs_for_city.select {|npc| binding.pry}
    end

    

end
