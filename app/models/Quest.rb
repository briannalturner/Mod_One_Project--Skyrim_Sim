class Quest < ActiveRecord::Base
    belongs_to :town

    $enemies = ["Bandit Chief", "Giant", "Dragon", "Hagraven", "Draugr", "Dwemer Centurion", "Bear"]
    $locations = ["Ysgramor's Tomb", "Faldar's Tooth", "Throat of the World", "Irngthamz", "Bleak Falls Barrow", "Frostmere Crypt", "Bronzewater Cave"]

    def self.quest_info(player, location, relationship)
        q = self.all.sample

        relationship.town_id = $current_location.id
        puts "\n"
        puts q.description.colorize(:yellow)
        location = $locations.find { |location| q.description.include?(location)}
        enemy = $enemies.find {|enemy| q.description.include?(enemy)}
        puts"The reward is #{q.reward} and the goodwill #{q.goodwill}\n".colorize(:yellow)
        puts"\n1. Accept Quest  2. Reject Quest\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp #return this as an argument for a new method called self.user_quest_decision(input)
        puts "\n\n"
        if input == '1'
            puts "You depart for your adventure to #{location}\n" #This returns name of place we are going to
            completion_chance = rand(20..100)
            if completion_chance > 60
                puts "\n. . .\n"
                #sleep(0.75)
                puts ". . .\n\n"
                #sleep(1)

                puts '▒█▀▀▀█ █░░█ █▀▀ █▀▀ █▀▀ █▀▀ █▀▀ '.colorize(:light_green)
                puts '░▀▀▀▄▄ █░░█ █░░ █░░ █▀▀ ▀▀█ ▀▀█ '.colorize(:light_green)
                puts '▒█▄▄▄█ ░▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ '.colorize(:light_green)

                puts "\nYou successfully completed the Quest!".colorize(:green)
                $current_player.money += q.reward
                relationship.goodwill += q.goodwill
                puts"You now have #{$current_player.money} septims and you gained #{q.goodwill} goodwill.".colorize(:green)
                #sleep(2.5)
                relationship.save
                $current_player.save
                player_options
            else
                puts "\n. . .\n"
                # sleep(0.75)
                puts ". . .\n\n"
                # sleep(?)

                puts '▒█▀▀▀ █▀▀█ ░▀░ █░░ █░░█ █▀▀█ █▀▀ '.colorize(:light_red)
                puts '▒█▀▀▀ █▄▄█ ▀█▀ █░░ █░░█ █▄▄▀ █▀▀ '.colorize(:light_red)
                puts '▒█░░░ ▀░░▀ ▀▀▀ ▀▀▀ ░▀▀▀ ▀░▀▀ ▀▀▀ '.colorize(:light_red)
                puts "\nYou reached the #{enemy}'s lair, only to get your ass wooped :( '".colorize(:red)
                puts "You flee for your life!".colorize(:red)
                puts ". . ."
                # sleep (2.5)
                puts "You make it back to #{$current_location.name}, barely alive."
                # sleep(1)
                player_options
            end
        elsif input == '2'
            puts "The Jarl said they wouldn't want a milkdrinker like you working for them anyways.".colorize(:red)
            sleep(1.5)
            player_options
        end

    end
end