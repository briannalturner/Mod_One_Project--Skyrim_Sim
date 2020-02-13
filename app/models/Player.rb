class Player < ActiveRecord::Base
    has_many :relationships
    has_many :towns, through: :relationships

    def enter_city(user_input_number)
        arr = ["Riften", "Windhelm", "Winterhold", "Whiterun", "Falkreath", "Markarth", "Dawnstar", "Morthal", "Solitude"]
        puts "The super cool logo thing"
        puts "Where do you want to go?"
        puts "\n3) Select your city:\n
        1. Riften    2. Windhelm    3. Winterhold    4. Whiterun    5. Falkreath\n
        6. Markarth    7. Dawnstar     8. Morthal        9. Solitude\n\n"
        print "enter number: "
        choice = arr[(gets.chomp.to_i - 1)]
        self.location = Town.find_by(name: choice).id
        binding.pry
    end
    
    def add_relationships(person_id)
        rel1 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[0].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Honeyside")
        rel2 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[1].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Hjerim")
        rel3 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[2].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel4 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[3].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Breezehome")
        rel5 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[4].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Lakeview Manor")
        rel6 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[5].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Vlindrel Hall")
        rel7 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[6].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Heljarchen Hall")
        rel8 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[7].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Winstad Manor")
        rel9 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[8].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Proudspire Manor")
    end

    #helper method to see an array of all relationships the instance player has
    def get_relationships
        Relationship.all.select { |instance| instance.player_id == self.id }
    end


    #delete this if it does not work
    def self.print_all_players
        puts "\n\nName of playable characters:\n".colorize(:green)
        Player.all.each do |instance|
            puts "  #{instance.name}".colorize(:yellow)
        end
    end

    def self.delete_specific_player
        self.print_all_players
        puts "---------"
        print "Input the name of the character you want to delete:  "
        input = gets.chomp
    
        if Player.find_by(:name => input) == nil #if player does not exist
            puts "\n*** That player does not exist... Select an option below ***\n".colorize(:red)
            puts "press (1) To try again\n\npress (q) to return to Main Menu\n\n"
            print "input: "
            second_input = gets.chomp
            if second_input == '1'
                delete_player_and_associated_relationships
            elsif second_input.downcase == 'q'
                run
            end
        else
            del_player = Player.find_by(:name => input)
            del_player.get_relationships.each {|instance| instance.destroy}
            del_player.destroy
            run
        end
    end

    def self.character_creation
        races = ['High Elf', 'Argonian', 'Wood Elf', 'Breton', 'Dark Elf', 'Imperial', 'Khajiit', 'Nord', 'Orc', 'Redguard']
        puts "\n\n"
        puts '      ▒█▀▀█ █░░█ █▀▀█ █▀▀█ █▀▀█ █▀▀ ▀▀█▀▀ █▀▀ █▀▀█ 　 ▒█▀▀█ █▀▀█ █▀▀ █▀▀█ ▀▀█▀▀ ░▀░ █▀▀█ █▀▀▄ '.colorize(:light_blue)
        puts '      ▒█░░░ █▀▀█ █▄▄█ █▄▄▀ █▄▄█ █░░ ░░█░░ █▀▀ █▄▄▀ 　 ▒█░░░ █▄▄▀ █▀▀ █▄▄█ ░░█░░ ▀█▀ █░░█ █░░█ '.colorize(:light_blue)
        puts "      ▒█▄▄█ ▀░░▀ ▀░░▀ ▀░▀▀ ▀░░▀ ▀▀▀ ░░▀░░ ▀▀▀ ▀░▀▀ 　 ▒█▄▄█ ▀░▀▀ ▀▀▀ ▀░░▀ ░░▀░░ ▀▀▀ ▀▀▀▀ ▀░░▀ \n".colorize(:light_blue)
        puts '      ***************************************************************************************'
        print "\n1) Input a name for your character:  "
        name = gets.chomp
        print "\n2) Input the gender for your character:  "
        gender = gets.chomp.capitalize
        puts "\n3) Select your race:\n
        1. High Elf    2. Argonian    3. Wood Elf    4. Breton    5. Dark Elf\n
        6. Imperial    7. Khajiit     8. Nord        9. Orc       10. Redguard\n\n"
        print "Enter Number: ".colorize(:light_blue)
        race = races[(gets.chomp.to_i - 1)]
    
        if Player.find_by(:name => name) == nil #If this player does not exist in the database... do
            new_player = Player.create(:name => name, :gender => gender, :race => race, :money => 0, :location => Town.all[0].id)
            $current_player = Player.find_by(:name => name)
            rel1 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[0].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Honeyside")
            rel2 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[1].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Hjerim")
            rel3 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[2].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
            rel4 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[3].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Breezehome")
            rel5 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[4].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Lakeview Manor")
            rel6 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[5].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Vlindrel Hall")
            rel7 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[6].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Heljarchen Hall")
            rel8 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[7].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Winstad Manor")
            rel9 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[8].id, thanehood: false, bounty: 0, goodwill: 0, home: false, home_name: "Proudspire Manor")
            $current_player = Player.find_by(:name => name)
            name = $current_player.name
    
        else #Looks like we already have this character in the database
            puts "\n\n\t\t\t\t----------NOTICE------------".colorize(:red)
            puts "\tthe name you used is already in the database... loading pre-existing account".colorize(:yellow)
            $current_player = Player.find_by(:name => name)
            name = $current_player.name
        end
        puts "\n"
        puts "      ********************************************************************************\n\n"
        puts '      ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀▀█ █░█ █░░█ █▀▀█ ░▀░ █▀▄▀█'.colorize(:light_blue)
        puts '      ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ░▀▀▀▄▄ █▀▄ █▄▄█ █▄▄▀ ▀█▀ █░▀░█'.colorize(:light_blue)
        puts '      ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▄▄█ ▀░▀ ▄▄▄█ ▀░▀▀ ▀▀▀ ▀░░░▀'.colorize(:light_blue)
        puts "\n"
    end
end
