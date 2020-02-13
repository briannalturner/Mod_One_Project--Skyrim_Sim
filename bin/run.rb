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
        $current_player = Player.create_character($current_player)
    elsif selection == '3'
        Player.print_all_players
        run
    elsif selection == '4'
        Player.delete_specific_player
        run
    elsif selection.downcase == 'q'
        exit
    else
        main_menu_selection
    end
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
        puts '      ▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀▀█ █░█ █░░█ █▀▀█ ░▀░ █▀▄▀█'.colorize(:light_blue)
        puts '      ▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ░▀▀▀▄▄ █▀▄ █▄▄█ █▄▄▀ ▀█▀ █░▀░█'.colorize(:light_blue)
        puts '      ▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▄▄█ ▀░▀ ▄▄▄█ ▀░▀▀ ▀▀▀ ▀░░░▀'.colorize(:light_blue)
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
        puts "1.".colorize(:blue)+ " Interact with citizens"+"     2.".colorize(:blue)+" Travel to another city\n"
        puts "3.".colorize(:blue)+ " Look for Quests"+"            4.".colorize(:blue)+" Buy home" 
        puts "5.".colorize(:blue)+ " Exit to Main Menu\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp
        if input == '1'
            Interaction.interact_with_citizens($current_player, $current_location)
        elsif input == '2'
            travel_menu
        elsif input == '3'
            quest_method
        elsif input == '4'
            Relationship.buy_home($current_player, $current_location)
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
        puts "What do you want to do?\n".colorize(:yellow)
        puts "1.".colorize(:blue)+ " Interact with citizens"+"     2.".colorize(:blue)+" Travel to another city\n"
        puts "3.".colorize(:blue)+ " Look for Quests"+"            4.".colorize(:blue)+" Buy home" 
        puts "5.".colorize(:blue)+ " Exit to Main Menu\n\n"
        print "Enter Number: ".colorize(:light_blue)
        input = gets.chomp
        if input == '1'
            Interaction.interact_with_citizens($current_player, $current_location)
        elsif input == '2'
            travel_menu
        elsif input == '3'
            quest_method
        elsif input == '4'
            puts "\nYou enter your home, #{relationship.home_name}...".colorize(:yellow)
            sleep(1.5)
            puts "\nAfter a good night's rest you reenter the streets of #{$current_location.name}.".colorize(:yellow)
            sleep(1.5)
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
    #binding.pry
    towns = Town.towns_array                            #array of all towns
    input = Town.user_selection                         #user selection of what town to go to (an integer)
    $current_location = towns[input - 1]
    $current_player.location = $current_location.id     #updating the current_player location... So that the next time we reach player_options menu... the location is correct.
    $current_player.save
    system("say 'Welcome to #{$current_location.name}'")
    get_logo(input)                                     #this will print ASCII text of town name
    player_options                                      #Returns back to player options to do in town.
end

def quest_method
    relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
    Quest.quest_info($currentplayer, $current_location, relationship)
end


def get_logo(input_from_travel_city_method)
    if input_from_travel_city_method == 1
        Town.riften_logo
    elsif input_from_travel_city_method == 2
        Town.windhelm_logo
    elsif input_from_travel_city_method == 3
        Town.winterhold_logo
    elsif input_from_travel_city_method == 4
        Town.whiterun_logo
    elsif input_from_travel_city_method == 5
        Town.falkreath_logo
    elsif input_from_travel_city_method == 6
        Town.markarth_logo
    elsif input_from_travel_city_method == 7
        Town.dawnstar_logo
    elsif input_from_travel_city_method == 8
        Town.morthal_logo
    elsif input_from_travel_city_method == 9
        Town.solitude_logo
    else
        puts "Invalid input".colorize(:light_red)
        puts "-------------"
    end
end


run

# 
# 0