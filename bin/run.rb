require_relative '../config/environment'
#require '../db/seeds.rb'
require 'colorize'
require 'colorized_string'


$current_player = nil
$current_location = nil

#after creating character... find way to login with that character. 

def run
    welcome
    main_menu_selection #choose to create a character or login to pre-existing character
    player_options #a list of options the selected player from 'selection_menu' can accomplish

end


def welcome
    puts "\n\n"
    puts'       ░██████╗██╗░░██╗██╗░░░██╗██████╗░██╗███╗░░░███╗  ░██████╗██╗███╗░░░███╗'.colorize(:light_blue)
    puts'       ██╔════╝██║░██╔╝╚██╗░██╔╝██╔══██╗██║████╗░████║  ██╔════╝██║████╗░████║'.colorize(:light_blue)
    puts'       ╚█████╗░█████═╝░░╚████╔╝░██████╔╝██║██╔████╔██║  ╚█████╗░██║██╔████╔██║'.colorize(:light_blue)
    puts'       ░╚═══██╗██╔═██╗░░░╚██╔╝░░██╔══██╗██║██║╚██╔╝██║  ░╚═══██╗██║██║╚██╔╝██║'.colorize(:light_blue)
    puts'       ██████╔╝██║░╚██╗░░░██║░░░██║░░██║██║██║░╚═╝░██║  ██████╔╝██║██║░╚═╝░██║'.colorize(:light_blue)
    puts'       ╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═╝░░░░░╚═╝  ╚═════╝░╚═╝╚═╝░░░░░╚═╝'.colorize(:light_blue)
    puts "\n\n\t\t\t\        Welcome to Skyrim\n\n".colorize(:blue)
end

def main_menu_selection
    # puts "Main Menu"
    puts "Please select one of the following options:"
    puts "\n"
    puts "1. Login"
    puts "2. Create a new character"
    puts "3. See list of existing player accounts"
    puts "4. Delete existing player"
    puts "Q. Exit Program"
    #maybe add a future puts statement for showing the current accounts?
    print "\n Input: ".colorize(:light_blue)
    selection = gets.chomp
    if selection == '1'
        login
    elsif selection == '2'
        create_character
    elsif selection == '3'
        print_all_players
    elsif selection == '4'
        delete_player_and_associated_relationships
    elsif selection.downcase == 'q'
        exit
    else
        main_menu_selection
    end
end

def create_character
    Player.character_creation
end

def print_all_players
    Player.print_all_players
    puts "\nThese are the current players within the database...\n\nPress any key to return to the main menu :) . . .  SPACE and ESCAPE key won't work here... thank me later".colorize(:green)
    gets.chomp
    run
end

def delete_player_and_associated_relationships
    Player.delete_specific_player
end

def login()
    puts "\n\n"

    puts '       ▒█░░░ █▀▀█ █▀▀▀ ░▀░ █▀▀▄ 　 ▀▀█▀▀ █▀▀█ 　 ▒█░░▒█ █▀▀█ █░░█ █▀▀█ 　 ░█▀▀█ █▀▀ █▀▀ █▀▀█ █░░█ █▀▀▄ ▀▀█▀▀ '.colorize(:light_blue)
    puts '       ▒█░░░ █░░█ █░▀█ ▀█▀ █░░█ 　 ░░█░░ █░░█ 　 ▒█▄▄▄█ █░░█ █░░█ █▄▄▀ 　 ▒█▄▄█ █░░ █░░ █░░█ █░░█ █░░█ ░░█░░ '.colorize(:light_blue)
    puts "       ▒█▄▄█ ▀▀▀▀ ▀▀▀▀ ▀▀▀ ▀░░▀ 　 ░░▀░░ ▀▀▀▀ 　 ░░▒█░░ ▀▀▀▀ ░▀▀▀ ▀░▀▀ 　 ▒█░▒█ ▀▀▀ ▀▀▀ ▀▀▀▀ ░▀▀▀ ▀░░▀ ░░▀░░\n".colorize(:light_blue)
    puts '      *****************************************************************************************************'

    print "\nEnter your name: ".colorize(:light_blue)
    name = gets.chomp
    
    if Player.find_by(:name => name) == nil 
        puts"This player doesn't exist"
        login()
    else
        $current_player = Player.find_by(:name => name)
        puts "\n"
        puts "      ********************************************************************************\n\n"

        puts '      ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀▀█ █░█ █░░█ █▀▀█ ░▀░ █▀▄▀█'
.colorize(:light_blue)
        puts '      ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ░▀▀▀▄▄ █▀▄ █▄▄█ █▄▄▀ ▀█▀ █░▀░█'
.colorize(:light_blue)
        puts '      ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▄▄█ ▀░▀ ▄▄▄█ ▀░▀▀ ▀▀▀ ▀░░░▀'
.colorize(:light_blue)
        puts "\n"
    end
    current_id = $current_player.id
    # $current_player.add_relationships(current_id)
    name = $current_player.name
    player_options
end

def player_options
    $current_location = Town.find($current_player.location)
    relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
    puts "\t\t\t      **************************\n\n"
    puts"Logged in as: ".colorize(:yellow) + "#{$current_player.name}".colorize(:blue)

    puts"\nYou are currently in: ".colorize(:yellow) + "#{$current_location.name}.".colorize(:blue)
    puts "   Money: ".colorize(:yellow) + "#{$current_player.money}"
    
    puts "   Reputation points: ".colorize(:yellow) + "#{relationship.goodwill}"
    puts "   Bounty: ".colorize(:yellow) + "#{relationship.bounty}"

    #For interactions should we make it so that we show all interactions possible in that location
    #since interactions class does not specify town location... we have to use npc.id and then get the npc.town_id 
    if relationship.home == false
        puts "\n\n----------------------------"
        puts "What do you want to do?\n".colorize(:yellow)
    puts "1.".colorize(:blue)+" Interact with citizens"+"       2.".colorize(:blue)+" Travel to another city\n"
    puts "3.".colorize(:blue)+" Look for Quests"+"     4.".colorize(:blue)+" Buy home"+"    5.".colorize(:blue)+ " Exit to Main Menu\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp
        if input == '1'
            interact_with_citizens
        elsif input == '2'
            travel_menu
        elsif input == '3'
            quest_method
        elsif input == '4'
            buy_home
            player_options
        elsif input == '5'
            puts "\n"
            run
        else
            puts'Invalid input. Please try again.'
            player_options
        end
    else
        puts "----------------------------\n"
        puts "\nWhat do you want to do?\n".colorize(:yellow)
    puts "1.".colorize(:blue)+" Interact with citizens"+"       2.".colorize(:blue)+" Travel to another city\n"
    puts "3.".colorize(:blue)+" Look for Quests"+"     4.".colorize(:blue)+" Visit your home"+"    5.".colorize(:blue)+ " Exit to Main Menu\n\n"
            print "Enter Number: ".colorize(:light_blue)
            input = gets.chomp
            if input == '1'
                interact_with_citizens
            elsif input == '2'
                travel_menu
            elsif input == '3'
                quest_method
            elsif input == '4'
                puts "You enter your home, #{relationship.home_name}...".colorize(:yellow)
                sleep(1.5)
                puts "\nAfter a good night's rest you reenter the streets of #{$current_location.name}.".colorize(:yellow)
                player_options
            elsif input == '5'
                puts "\n"
                run
            else
                puts'Invalid input. Please try again.'
                player_options
            end
    end
end

def travel_menu
    binding.pry
    towns = Town.towns_array                            #array of all towns
    input = Town.user_selection                         #user selection of what town to go to (an integer)
    $current_location = towns[input - 1]
    $current_player.location = $current_location.id     #updating the current_player location... So that the next time we reach player_options menu... the location is correct.
    system("say 'Welcome to #{$current_location.name}'")
    get_logo(input)                                     #this will print ASCII text of town name
    player_options                                      #Returns back to player options to do in town.
end

def interact_with_citizens
    # all interactions for city
    x = Interaction.all.select { |inst|
        inst.town_id == $current_player.location
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
    relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
    puts "\n"
    puts "*******************************"
    puts "       INTERACTION MENU".colorize(:light_blue)
    puts "*******************************"
    puts "\nYou see the following citizens:\n
    1. #{names[0]}   2. #{names[2]}\n
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
        print "Enter Number: ".colorize(:light_blue)
        input2 = gets.chomp

        if input2 == '1'
            puts "\n"
            puts x[0].description.colorize(:yellow)
            sleep(1.5)
            if x[0].bounty
                relationship.bounty += x[0].bounty
                relationship.save
                puts"Your bounty is #{relationship.bounty}".colorize(:red)
            end
            interact_with_citizens
        elsif input2 == '2'
            puts "\n"
            puts x[1].description.colorize(:yellow)
            sleep(1.5)
            if x[1].bounty
                relationship.bounty += x[1].bounty
                relationship.save
                puts"Your bounty is #{relationship.bounty}".colorize(:red)
            end
            interact_with_citizens
        else
            puts'Invalid input. Please try again'
            interact_with_citizens
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
                puts"Your bounty is #{relationship.bounty}".colorize(:red)
            end
            interact_with_citizens
        elsif input2 == '2'
            puts "\n"
            puts x[3].description.colorize(:yellow)
            sleep(1.5)
            if x[3].bounty
                relationship.bounty += x[3].bounty
                relationship.save
                puts"Your bounty is #{relationship.bounty}".colorize(:red)
            end
            interact_with_citizens
        else
            puts'Invalid input. Please try again'
            interact_with_citizens
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
                puts"Your bounty is #{relationship.bounty}".colorize(:red)
            end
            interact_with_citizens
        elsif input2 == '2'
            puts "\n"
            puts x[5].description.colorize(:yellow)
            sleep(1.5)
            if x[5].bounty
                relationship.bounty += x[5].bounty
                relationship.save
                puts"Your bounty is #{relationship.bounty}".colorize(:red)
            end
            interact_with_citizens
        else
            puts'Invalid input. Please try again'
            interact_with_citizens
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
                puts"Your bounty is #{relationship.bounty}".colorize(:red)
            end
            interact_with_citizens
        elsif input2 == '2'
            puts "\n"
            puts x[7].description.colorize(:yellow)
            sleep(1.5)
            if x[7].bounty
                relationship.bounty += x[7].bounty
                relationship.save
                puts"Your bounty is #{relationship.bounty}".colorize(:red)
            end
            interact_with_citizens
        else
            puts'Invalid input. Please try again'
            interact_with_citizens
        end
    elsif input == '5'
        player_options
    else
        puts'*******************************'
        puts'Invalid input. Please try again'
        puts'*******************************'
        interact_with_citizens
    end
end

def quest_method
    relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
    q = Quest.all.sample
    # 
    relationship.town_id = $current_location.id
    puts "\n"
    puts q.description
    puts"The reward is #{q.reward} and the goodwill #{q.goodwill}\n"
    puts"\n1. Accept Quest  2. Reject Quest\n\n"
    print "Enter Number: ".colorize(:light_blue)
    input = gets.chomp
    puts "\n\n"
    if input == '1'
        puts "You depart for your adventure to the #{q.description.split(" ")[-1]}\n" #This returns name of place we are going to
        completion_chance = 80 #rand(0..100)
        #
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


def enter_city(user_input_number)
    arr = ["Riften", "Windhelm", "Winterhold", "Whiterun", "Falkreath", "Markarth", "Dawnstar", "Morthal", "Solitude"]
    puts "The super cool logo thing"
    puts "Where do you want to go?"
    puts "\n3) Select your city:\n
    1. Riften    2. Windhelm    3. Winterhold    4. Whiterun    5. Falkreath\n
    6. Markarth    7. Dawnstar     8. Morthal        9. Solitude\n\n"
    print "Enter Number: ".colorize(:light_blue)
    choice = arr[(gets.chomp.to_i - 1)]
end

def visit_city(name)
    puts "You have arrived in #{name}"

end

def find_city_id_by_name(string)
    x = Town.all.select { |city|
        city.name == string
    }
    x.id
end

def get_logo(input_from_travel_city_method)
    if input_from_travel_city_method == 1
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀█ ░▀░ █▀▀ ▀▀█▀▀ █▀▀ █▀▀▄ '
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▄▄▀ ▀█▀ █▀▀ ░░█░░ █▀▀ █░░█ '
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░▒█ ▀▀▀ ▀░░ ░░▀░░ ▀▀▀ ▀░░▀ '
        puts ""
    elsif input_from_travel_city_method == 2
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█░░▒█ ░▀░ █▀▀▄ █▀▀▄ █░░█ █▀▀ █░░ █▀▄▀█'
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▒█▒█ ▀█▀ █░░█ █░░█ █▀▀█ █▀▀ █░░ █░▀░█'
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▀▄█ ▀▀▀ ▀░░▀ ▀▀▀░ ▀░░▀ ▀▀▀ ▀▀▀ ▀░░░'
        puts ""
    elsif input_from_travel_city_method == 3
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█░░▒█ ░▀░ █▀▀▄ ▀▀█▀▀ █▀▀ █▀▀█ █░░█ █▀▀█ █░░ █▀▀▄'
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▒█▒█ ▀█▀ █░░█ ░░█░░ █▀▀ █▄▄▀ █▀▀█ █░░█ █░░ █░░█'
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▀▄█ ▀▀▀ ▀░░▀ ░░▀░░ ▀▀▀ ▀░▀▀ ▀░░▀ ▀▀▀▀ ▀▀▀ ▀▀▀░'
        puts ""
    elsif input_from_travel_city_method == 4
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█░░▒█ █░░█ ░▀░ ▀▀█▀▀ █▀▀ █▀▀█ █░░█ █▀▀▄'
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▒█▒█ █▀▀█ ▀█▀ ░░█░░ █▀▀ █▄▄▀ █░░█ █░░█'
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▀▄█ ▀░░▀ ▀▀▀ ░░▀░░ ▀▀▀ ▀░▀▀ ░▀▀▀ ▀░░▀'
        puts ""
    elsif input_from_travel_city_method == 5
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀▀ █▀▀█ █░░ █░█ █▀▀█ █▀▀ █▀▀█ ▀▀█▀▀ █░░█'
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▀▀▀ █▄▄█ █░░ █▀▄ █▄▄▀ █▀▀ █▄▄█ ░░█░░ █▀▀█'
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░░░ ▀░░▀ ▀▀▀ ▀░▀ ▀░▀▀ ▀▀▀ ▀░░▀ ░░▀░░ ▀░░▀'
        puts ""
    elsif input_from_travel_city_method == 6
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▄▀█ █▀▀█ █▀▀█ █░█ █▀▀█ █▀▀█ ▀▀█▀▀ █░░█'
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▒█▒█ █▄▄█ █▄▄▀ █▀▄ █▄▄█ █▄▄▀ ░░█░░ █▀▀█'
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░░▒█ ▀░░▀ ▀░▀▀ ▀░▀ ▀░░▀ ▀░▀▀ ░░▀░░ ▀░░▀'
        puts ""
    elsif input_from_travel_city_method == 7
        3.times { puts ""}
        puts '       ██████╗░░█████╗░░██╗░░░░░░░██╗███╗░░██╗░██████╗████████╗░█████╗░██████╗░'
        puts '       ██╔══██╗██╔══██╗░██║░░██╗░░██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗'
        puts '       ██║░░██║███████║░╚██╗████╗██╔╝██╔██╗██║╚█████╗░░░░██║░░░███████║██████╔╝'
        puts '       ██║░░██║██╔══██║░░████╔═████║░██║╚████║░╚═══██╗░░░██║░░░██╔══██║██╔══██╗'
        puts '       ██████╔╝██║░░██║░░╚██╔╝░╚██╔╝░██║░╚███║██████╔╝░░░██║░░░██║░░██║██║░░██║'
        puts '       ╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝'
        puts ""
    elsif input_from_travel_city_method == 8
        3.times { puts ""}
        puts '   ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 █▀▄▀█ █▀▀█ █▀▀█ ▀▀█▀▀ █░░█ █▀▀█ █░░'
        puts '   ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 █░▀░█ █░░█ █▄▄▀ ░░█░░ █▀▀█ █▄▄█ █░░'
        puts '   ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▀░░░▀ ▀▀▀▀ ▀░▀▀ ░░▀░░ ▀░░▀ ▀░░▀ ▀▀▀'
        puts ""
    elsif input_from_travel_city_method == 9
        3.times { puts ""}
        puts "\t\t  ╭╮╭╮╭╮╱╱╭╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱ ╭╮╱╱╱╱ ╭━━━╮╱╱╭╮╱╭╮╱╱╱╱╱╭╮"
        puts "\t\t  ┃┃┃┃┃┃╱╱┃┃╱╱╱╱╱╱╱╱╱╱╱╱╱ ╭╯╰╮╱╱╱ ┃╭━╮┃╱╱┃┃╭╯╰╮╱╱╱╱┃┃"
        puts "\t\t  ┃┃┃┃┃┣━━┫┃╭━━┳━━┳╮╭┳━━╮ ╰╮╭╋━━╮ ┃╰━━┳━━┫┃┣╮╭╋╮╭┳━╯┣━━╮"
        puts "\t\t  ┃╰╯╰╯┃┃━┫┃┃╭━┫╭╮┃╰╯┃┃━┫╱ ┃┃┃╭╮┃ ╰━━╮┃╭╮┃┃┣┫┃┃┃┃┃╭╮┃┃━┫"
        puts "\t\t  ╰╮╭╮╭┫┃━┫╰┫╰━┫╰╯┃┃┃┃┃━┫╱ ┃╰┫╰╯┃ ┃╰━╯┃╰╯┃╰┫┃╰┫╰╯┃╰╯┃┃━┫"
        puts "\t\t  ╱╰╯╰╯╰━━┻━┻━━┻━━┻┻┻┻━━╯╱ ╰━┻━━╯ ╰━━━┻━━┻━┻┻━┻━━┻━━┻━━╯"
        puts ""
    else
        puts "Invalid input"
        puts "-------------"
    end

end

def buy_home
    relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
    relationship.home = true
    binding.pry
    relationship.save
    puts "You now own #{relationship.home_name}"
end


run

# 
# 0