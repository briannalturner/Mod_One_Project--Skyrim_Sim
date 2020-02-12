class Relationship < ActiveRecord::Base
    belongs_to :players
    belongs_to :towns
    
    def update()
        ### Stuck need to find a way to update an instance of a pre-existing instance that we declared in the beginning
        #i.e Want to update Player Relationship Instance with Riften when we get more xp... but how do we edit a pre-existed instance using self?
        #updated_relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
        update_instance = Relationship.all.select{|instance| instance.player_id == self.player_id && instance.town_id == self.town_id}

        updated_relationship = self
        return updated_relationship
        #return self #returns the updated relationship????
    end

    # def get_npcs_for_city
    #     Npc.all.select {|npc| self.id == npc.town_id} 
    # end

    # #We have to go through all interactions... and find the npc_id associated with that interaction.
    # def get_interactions_for_city
    #     self.get_npcs_for_city.select {|npc| binding.pry}
    # end
end

