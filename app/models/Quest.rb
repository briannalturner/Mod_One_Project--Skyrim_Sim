class Quest < ActiveRecord::Base
    belongs_to :town

    def self.quest_info(player, location, relationship)
        q = self.all.sample

        relationship.town_id = $current_location.id
        puts "\n"
        puts q.description
        puts"The reward is #{q.reward} and the goodwill #{q.goodwill}\n"
        puts"\n1. Accept Quest  2. Reject Quest\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp #return this as an argument for a new method called self.user_quest_decision(input)
        puts "\n\n"
        if input == '1'
            puts "You depart for your adventure to the #{q.description.split(" ")[-1]}\n" #This returns name of place we are going to
            completion_chance = rand(0..100)
            if completion_chance > 60
                puts ". . .\n. . .\n"
                puts'You successfully completed the Quest.'.colorize(:green)
                $current_player.money += q.reward
                relationship.goodwill += q.goodwill
                puts"You now have #{$current_player.money} septims and you gained #{q.goodwill} goodwill.\n\n".colorize(:green)
                relationship.save
                $current_player.save
                player_options
            else
                puts ". . .\n. . .\n"
                puts "Along the way you realize the challenge ahead of you and you say  '!@#$ it.' '".colorize(:yellow)
                puts "With that you decide to head back to town\n\n".colorize(:yellow)
                player_options
            end
        elsif input == '2'
            player_options
        end

    end
end