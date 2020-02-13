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

    def self.towns_array
        [Town.all[0], Town.all[1], Town.all[2] ,Town.all[3], Town.all[4], Town.all[5] ,Town.all[6], Town.all[7], Town.all[8]]
    end
    def self.user_selection
        towns = self.towns_array
        puts "------------------------------------\n"
        puts "Which city do you want to travel to?\n".colorize(:yellow)
        puts "1.".colorize(:blue)+" #{towns[0].name}"+"       2.".colorize(:blue)+" #{towns[1].name}"+"     3.".colorize(:blue)+ " #{towns[2].name}\n"
        puts "4.".colorize(:blue)+" #{towns[3].name}"+"     5.".colorize(:blue)+" #{towns[4].name}"+"    6.".colorize(:blue)+ " #{towns[5].name}\n"
        puts "7.".colorize(:blue)+" #{towns[6].name}"+"     8.".colorize(:blue)+" #{towns[7].name}"+"      9.".colorize(:blue)+ " #{towns[8].name}\n\n"
        print "Enter Number:  ".colorize(:light_blue)
        input = gets.chomp.to_i
        return input
    end

end
