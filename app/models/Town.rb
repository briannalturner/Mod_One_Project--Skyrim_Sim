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

    def self.riften_logo
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀█ ░▀░ █▀▀ ▀▀█▀▀ █▀▀ █▀▀▄ '.colorize(:magenta)
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▄▄▀ ▀█▀ █▀▀ ░░█░░ █▀▀ █░░█ '.colorize(:magenta)
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░▒█ ▀▀▀ ▀░░ ░░▀░░ ▀▀▀ ▀░░▀ '.colorize(:magenta)
        puts ""
    end

    def self.windhelm_logo
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█░░▒█ ░▀░ █▀▀▄ █▀▀▄ █░░█ █▀▀ █░░ █▀▄▀█'.colorize(:blue)
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▒█▒█ ▀█▀ █░░█ █░░█ █▀▀█ █▀▀ █░░ █░▀░█'.colorize(:blue)
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▀▄█ ▀▀▀ ▀░░▀ ▀▀▀░ ▀░░▀ ▀▀▀ ▀▀▀ ▀░░░ '.colorize(:blue)
        puts ""
    end

    def self.winterhold_logo
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█░░▒█ ░▀░ █▀▀▄ ▀▀█▀▀ █▀▀ █▀▀█ █░░█ █▀▀█ █░░ █▀▀▄'.colorize(:light_blue)
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▒█▒█ ▀█▀ █░░█ ░░█░░ █▀▀ █▄▄▀ █▀▀█ █░░█ █░░ █░░█'.colorize(:light_blue)
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▀▄█ ▀▀▀ ▀░░▀ ░░▀░░ ▀▀▀ ▀░▀▀ ▀░░▀ ▀▀▀▀ ▀▀▀ ▀▀▀░'.colorize(:light_blue)
        puts ""
    end

    def self.whiterun_logo
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█░░▒█ █░░█ ░▀░ ▀▀█▀▀ █▀▀ █▀▀█ █░░█ █▀▀▄'.colorize(:light_yellow)
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▒█▒█ █▀▀█ ▀█▀ ░░█░░ █▀▀ █▄▄▀ █░░█ █░░█'.colorize(:light_yellow)
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▀▄█ ▀░░▀ ▀▀▀ ░░▀░░ ▀▀▀ ▀░▀▀ ░▀▀▀ ▀░░▀'.colorize(:light_yellow)
        puts ""
    end

    def self.falkreath_logo
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀▀ █▀▀█ █░░ █░█ █▀▀█ █▀▀ █▀▀█ ▀▀█▀▀ █░░█'.colorize(:green)
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▀▀▀ █▄▄█ █░░ █▀▄ █▄▄▀ █▀▀ █▄▄█ ░░█░░ █▀▀█'.colorize(:green)
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░░░ ▀░░▀ ▀▀▀ ▀░▀ ▀░▀▀ ▀▀▀ ▀░░▀ ░░▀░░ ▀░░▀'.colorize(:green)
        puts ""
    end

    def self.markarth_logo
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▄▀█ █▀▀█ █▀▀█ █░█ █▀▀█ █▀▀█ ▀▀█▀▀ █░░█'.colorize(:green)
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▒█▒█ █▄▄█ █▄▄▀ █▀▄ █▄▄█ █▄▄▀ ░░█░░ █▀▀█'.colorize(:green)
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░░▒█ ▀░░▀ ▀░▀▀ ▀░▀ ▀░░▀ ▀░▀▀ ░░▀░░ ▀░░▀'.colorize(:green)
        puts ""
    end

    def self.dawnstar_logo
        3.times { puts ""}
        puts '▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀▄ █▀▀█ █░░░█ █▀▀▄ █▀▀ ▀▀█▀▀ █▀▀█ █▀▀█ '.colorize(:light_black)
        puts '▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█░▒█ █▄▄█ █▄█▄█ █░░█ ▀▀█ ░░█░░ █▄▄█ █▄▄▀ '.colorize(:light_black)
        puts '▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▄▀ ▀░░▀ ░▀░▀░ ▀░░▀ ▀▀▀ ░░▀░░ ▀░░▀ ▀░▀▀ '.colorize(:light_black)
        puts ""
    end

    def self.morthal_logo
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 █▀▄▀█ █▀▀█ █▀▀█ ▀▀█▀▀ █░░█ █▀▀█ █░░'.colorize(:green)
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 █░▀░█ █░░█ █▄▄▀ ░░█░░ █▀▀█ █▄▄█ █░░'.colorize(:green)
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▀░░░▀ ▀▀▀▀ ▀░▀▀ ░░▀░░ ▀░░▀ ▀░░▀ ▀▀▀'.colorize(:green)
        puts ""
    end

    def self.solitude_logo
        3.times { puts ""}
        puts '▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀▀█ █▀▀█ █░░ ░▀░ ▀▀█▀▀ █░░█ █▀▀▄ █▀▀ '.colorize(:light_red)
        puts '▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ░▀▀▀▄▄ █░░█ █░░ ▀█▀ ░░█░░ █░░█ █░░█ █▀▀ '.colorize(:light_red)
        puts '▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▄▄█ ▀▀▀▀ ▀▀▀ ▀▀▀ ░░▀░░ ░▀▀▀ ▀▀▀░ ▀▀▀ '.colorize(:light_red)
        puts ""
    end
end
