class Relationship < ActiveRecord::Base
    belongs_to :player
    belongs_to :town
    
    def update()
        ### Stuck need to find a way to update an instance of a pre-existing instance that we declared in the beginning
        #i.e Want to update Player Relationship Instance with Riften when we get more xp... but how do we edit a pre-existed instance using self?
        #updated_relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
        update_instance = Relationship.all.select{|instance| instance.player_id == self.player_id && instance.town_id == self.town_id}

        updated_relationship = self
        return updated_relationship
        #return self #returns the updated relationship????
    end

    def get_npcs_for_city
        Npc.all.select {|npc| self.id == npc.town_id} 
    end

    #We have to go through all interactions... and find the npc_id associated with that interaction.
    def get_interactions_for_city
        self.get_npcs_for_city.select {|npc| binding.pry}
    end

    def self.buy_home(current_player, current_location)
        relationship = self.find_by(:player_id => current_player.id, :town_id => current_location.id)
        puts "\nThe only home available in this city is #{relationship.home_name}. The cost is 5000 septims.\n
Would you like to buy it?\n".colorize(:yellow)
        print "Y / N: ".colorize(:blue)
        input = gets.chomp.downcase

        if input == 'y'
            if current_player.money >= 5000
                relationship.home = true
                relationship.save
                player.money -= 5000
                player.save
                puts "\nYou now own #{relationship.home_name}".colorize(:yellow)
                sleep(1.5)
            else
                puts "\nI think we both know you can't afford this house. Do some quests and come back when you have enough money.".colorize(:light_red)
                sleep(2)
            end
        elsif input == 'n'
            puts "\nNobody likes a tease.".colorize(:light_red)
            sleep(1.5)
        else
            puts "\nINVALID INPUT".colorize(:light_red)
            sleep(1.5)
        end 
    end
end

