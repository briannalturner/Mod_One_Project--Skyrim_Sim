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
                current_player.money -= 5000
                current_player.save
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

    def self.guards_attempt_arrest(current_player, current_location)
        relationship = self.find_by(:player_id => current_player.id, :town_id => current_location.id)
        puts "\n. . ."
        sleep(1)
        puts "\nA guard approaches you.".colorize(:red)
        sleep(2)
        puts "\n\n****************"
        puts "GUARD\n".colorize(:yellow)
        puts "\nYou have committed crimes against Skyrim and her people. What say you in your defense?"
        sleep(2)
        puts "\nYou have #{current_player.money} septims.\n\n".colorize(:light_blue)
        puts "1. Run away!   2. Kill the Guard   3. Pay bounty(#{relationship.bounty} septims)  4. Go to jail\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp
        input
    end

    def self.guards_are_fed_up(current_player, current_location)
        relationship = self.find_by(:player_id => current_player.id, :town_id => current_location.id)
        puts "\n. . ."
        sleep(1)
        puts "\nMultiple guards approach you.".colorize(:red)
        sleep(2)
        puts "\n\n****************"
        puts "GUARD\n".colorize(:yellow)
        puts "\nHey it's the murderous #{current_player.race}! Stop right there!"
        puts "\nYou are clearly outnumbered what are you going to do?".colorize(:red)
        sleep(2)
        puts "1. Attempt to run away!   2. Kill the Guards   3. Accept Arrest\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp
        input
    end

    def self.guards_beg_for_mercy(current_player, current_location)
        relationship = self.find_by(:player_id => current_player.id, :town_id => current_location.id)
        puts "\n. . ."
        sleep(1)
        puts "\nA guard approaches you.".colorize(:red)
        sleep(2)
        puts "\n\n****************"
        puts "GUARD\n".colorize(:yellow)
        puts "\nLook, I know you're the thane and all but... Could you stop killing people?"
        sleep(2)
        puts "\nYou have #{current_player.money} septims.\n\n".colorize(:light_blue)
        puts "1. Ignore him   2. Kill him   3. Pay bounty(free)\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp
        return input
    end

    def self.thane_quest(current_player, current_location)
        enemies = ["bandits", "forsworn", "ice wraiths", "dwemer animunculi", "Falmer", "draugr", "vampires", "dark brotherhood agents"]
        locations = ["Statue to Meridia", "Gjukar's Monument", "Druadach Redoubt", "Knifepoint Ridge", "Broken Fang Cave", "Eldergleam Sanctuary", "Snapleg Cave"]
        chosen_enemy = enemies.sample
        chosen_location = locations.sample
        correct_order = ['1', '2']


        puts "\n\n. . . . .\n\n"
        sleep(1)
        puts "#{current_location.jarl} has asked you to clear out all of the #{chosen_enemy} at #{chosen_location}. This is going to be a difficult adventure full of many choices."
        sleep(2.5)
        puts "\n\n. . . . .\n\n"
        sleep(1)

        puts "You enter #{chosen_location}.\n\n".colorize(:yellow)
        2.times do 
            puts "You walk forward a few steps.\n"
            puts "There is an enemy just ahead of you.\n\n"
            puts "1. Sneak attack   2. Attack head-on\n\n"
            print "Enter Number: ".colorize(:light_blue)
            input = gets.chomp
            correct_answer = correct_order.sample
            sleep(1)
            puts "\n\n. . . . .\n\n"
            sleep(1)

            if input == correct_answer
                puts "You successfully kill the enemy.\n".colorize(:light_green)
            else
                puts "The enemy overcomes you and you are forced to flee. You failed #{current_location.jarl} and have not become Thane of #{current_location.name}.".colorize(:yellow)
                sleep(2)
                return false
            end
        end
        puts "\n\n. . . . .\n\n"
        sleep(1)
        puts '▒█▀▀▀█ █░░█ █▀▀ █▀▀ █▀▀ █▀▀ █▀▀ '.colorize(:light_green)
        puts '░▀▀▀▄▄ █░░█ █░░ █░░ █▀▀ ▀▀█ ▀▀█ '.colorize(:light_green)
        puts '▒█▄▄▄█ ░▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ '.colorize(:light_green)

        puts "\nYou successfully completed the Quest!".colorize(:green)
        sleep(1.5)
        puts "\n\nYou are now Thane of #{current_location.name}. From this point on, you are above the law in this city.\n\n"
        sleep(2)
        return true
    end
end

