class Interaction < ActiveRecord::Base
    belongs_to :npc
    
    def self.interact_with_citizens(current_player, current_location)
        # all interactions for city
        x = self.all.select { |inst|
            inst.town_id == current_player.location
        }
        # gives npc ids
        ids = x.map{ |interaction|
            interaction.npc_id
        }
        # gives npc names
        names = [] 
        npc_descriptions = []
        ids.each{ |x|
            names << Npc.all.find_by(id: x).name
            npc_descriptions << Npc.all.find_by(id: x).description
        }
        relationship = Relationship.find_by(:player_id => current_player.id, :town_id => current_location.id)
        puts "\n"
        puts "*******************************"
        puts "       INTERACTION MENU".colorize(:light_blue)
        puts "*******************************"
        puts "\nYou see the following citizens:\n".colorize(:yellow)
puts "1. #{names[0]}   2. #{names[2]}\n
3. #{names[4]}   4. #{names[6]}\n
5. Exit\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp
    
        if input == '1'
            puts "\n***************************\n"
            puts "#{names[0].upcase}".colorize(:yellow)
            puts "\n"
            puts "#{npc_descriptions[0]}"
            puts "\n"
            puts"1. #{x[0].action_name}     2. #{x[1].action_name}\n"
            print "Enter Number: ".colorize(:light_blue)
            input2 = gets.chomp
    
            if input2 == '1'
                puts "\n"
                puts x[0].description.colorize(:yellow)
                sleep(1.5)
                if x[0].bounty
                    relationship.bounty += x[0].bounty
                    relationship.save
                    puts"\nYour bounty is #{relationship.bounty}".colorize(:red)
                    sleep(2)
                end
                self.interact_with_citizens(current_player, current_location)
            elsif input2 == '2'
                puts "\n"
                puts x[1].description.colorize(:yellow)
                sleep(1.5)
                if x[1].bounty
                    relationship.bounty += x[1].bounty
                    relationship.save
                    puts"\nYour bounty is #{relationship.bounty}".colorize(:red)
                    sleep(2)
                end
                self.interact_with_citizens(current_player, current_location)
            else
                puts'Invalid input. Please try again'
                self.interact_with_citizens(current_player, current_location)
            end
        elsif input == '2'
            puts "\n***************************\n"
            puts "#{names[2].upcase}".colorize(:yellow)
            puts "\n"
            puts "#{npc_descriptions[2]}"
            puts "\n"
            puts"1. #{x[2].action_name}     2. #{x[3].action_name}"
            print "Enter Number: ".colorize(:light_blue)
            input2 = gets.chomp
            if input2 == '1'
                puts "\n"
                puts x[2].description.colorize(:yellow)
                sleep(1.5)
                if x[2].bounty
                    relationship.bounty += x[2].bounty
                    relationship.save
                    puts"\nYour bounty is #{relationship.bounty}".colorize(:red)
                    sleep(2)
                end
                self.interact_with_citizens(current_player, current_location)
            elsif input2 == '2'
                puts "\n"
                puts x[3].description.colorize(:yellow)
                sleep(1.5)
                if x[3].bounty
                    relationship.bounty += x[3].bounty
                    relationship.save
                    puts"\nYour bounty is #{relationship.bounty}".colorize(:red)
                    sleep(2)
                end
                self.interact_with_citizens(current_player, current_location)
            else
                puts'Invalid input. Please try again'
                self.interact_with_citizens(current_player, current_location)
            end
        elsif input == '3'
            puts "\n***************************\n"
            puts "#{names[4].upcase}".colorize(:yellow)
            puts "\n"
            puts "#{npc_descriptions[4]}"
            puts "\n"
            puts"1. #{x[4].action_name}     2. #{x[5].action_name}"
            print "Enter Number: ".colorize(:light_blue)
            input2 = gets.chomp
            if input2 == '1'
                puts "\n"
                puts x[4].description.colorize(:yellow)
                sleep(1.5)
                if x[4].bounty
                    relationship.bounty += x[4].bounty
                    relationship.save
                    puts"\nYour bounty is #{relationship.bounty}".colorize(:red)
                    sleep(2)
                end
                self.interact_with_citizens(current_player, current_location)
            elsif input2 == '2'
                puts "\n"
                puts x[5].description.colorize(:yellow)
                if x[5].description.include?('You hand Edda 5 gold.')
                    current_player.money -= 5
                    current_player.save
                end
                sleep(1.5)
                if x[5].bounty
                    relationship.bounty += x[5].bounty
                    relationship.save
                    puts"\nYour bounty is #{relationship.bounty}".colorize(:red)
                    sleep(2)
                end
                self.interact_with_citizens(current_player, current_location)
            else
                puts'Invalid input. Please try again'
                self.interact_with_citizens(current_player, current_location)
            end
        elsif input == '4'
            puts "\n***************************\n"
            puts "#{names[6].upcase}".colorize(:yellow)
            puts "\n"
            puts "#{npc_descriptions[6]}"
            puts "\n"
            puts"1. #{x[6].action_name}     2. #{x[7].action_name}"
            print "Enter Number: ".colorize(:light_blue)
            input2 = gets.chomp
            if input2 == '1'
                puts "\n"
                puts x[6].description.colorize(:yellow)
                sleep(1.5)
                if x[6].bounty
                    relationship.bounty += x[6].bounty
                    relationship.save
                    puts"\nYour bounty is #{relationship.bounty}".colorize(:red)
                    sleep(2)
                end
                self.interact_with_citizens(current_player, current_location)
            elsif input2 == '2'
                puts "\n"
                puts x[7].description.colorize(:yellow)
                sleep(1.5)
                if x[7].bounty
                    relationship.bounty += x[7].bounty
                    relationship.save
                    puts"\nYour bounty is #{relationship.bounty}".colorize(:red)
                    sleep(2)
                end
                self.interact_with_citizens(current_player, current_location)
            else
                puts'Invalid input. Please try again'
                self.interact_with_citizens(current_player, current_location)
            end
        elsif input == '5'
            player_options
        else
            puts'*******************************'
            puts'Invalid input. Please try again'
            puts'*******************************'
            self.interact_with_citizens(current_player, current_location)
        end
    end
end