require_relative '../config/environment'
require 'colorize'
require 'colorized_string'


$current_player = nil
$current_location = nil

#So currently in our pre-existing files... if we reset the seed data we will lose the relationships for initial players: "Bri", "Alan" etc...

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
    print "\nInput: ".colorize(:light_blue)
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
        puts "\nThis player doesn't exist".colorize(:red)
        sleep(1)
        run
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
    puts"Name: ".colorize(:light_cyan) + "#{$current_player.name}"

    puts "\nRace: #{$current_player.race}"
    puts "Gender: #{$current_player.gender}"
    puts"\nYou are currently in: ".colorize(:yellow) + "#{$current_location.name}.".colorize(:blue)
    puts "   Money: ".colorize(:yellow) + "#{$current_player.money}"
    #binding.pry
    puts "   Reputation points: ".colorize(:yellow) + "#{relationship.goodwill}"
    puts "   Bounty: ".colorize(:yellow) + "#{relationship.bounty}"

    if relationship.thanehood == false
        if relationship.bounty >= 1000
            relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
            input = Relationship.guards_attempt_arrest($current_player, $current_location)
            if input == '1'
                puts "You managed to escape.\n".colorize(:yellow)
                sleep(1)
                travel_menu
            elsif input == '2'
                puts "You killed the guard.\n".colorize(:yellow)
                relationship.bounty += 1000
                relationship.save
                puts "Your bounty is now #{relationship.bounty}.".colorize(:light_red)
                sleep(1)
                player_options
            elsif input == '3'
                if $current_player.money >= relationship.bounty
                    puts "\n\n****************"
                    puts "GUARD\n".colorize(:yellow)
                    puts "\nYou're not as stupid as you look."
                    sleep(1)
                    $current_player.money -= relationship.bounty
                    relationship.bounty = 0
                    relationship.save
                    puts "\nYour bounty is now #{relationship.bounty}.".colorize(:yellow)
                    sleep(1)
                    player_options
                else
                    puts "\n\n****************"
                    puts "GUARD\n".colorize(:yellow)
                    puts "\nYour broke ass is going to jail."
                    sleep(1)
                    puts "\n. . .\n"
                    sleep(1)
                    puts "\n. . .\n"
                    sleep(1)
                    puts "\nYou emerge from #{$current_location.name}'s dungeon many years later, a reformed #{$current_player.race}."
                    sleep(2)
                    relationship.bounty = 0
                    relationship.save
                    puts "\nYour bounty is now #{relationship.bounty}.".colorize(:yellow)
                    sleep(2)
                    player_options
                end
            elsif input == '4'
                puts "\n. . .\n"
                sleep(1)
                puts "\n. . .\n"
                sleep(1)
                puts "\nYou emerge from #{$current_location.name}'s dungeon many years later, a reformed #{$current_player.race}."
                sleep(2)
                relationship.bounty = 0
                relationship.save
                puts "\nYour bounty is now #{relationship.bounty}.".colorize(:yellow)
                sleep(2)
                player_options
            else
                puts "INVALID INPUT\n".colorize(:light_red)
                sleep(1)
                Relationship.guards_attempt_arrest
            end
        end
    end
    if relationship.thanehood == true && relationship.bounty >= 5000
        relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
        input = Relationship.guards_beg_for_mercy($current_player, $current_location)
        if input == '1'
            puts "You give the guard the finger and walk away.\n".colorize(:yellow)
            sleep(1)
        elsif input == '2'
            puts "You killed the guard.\n".colorize(:yellow)
            relationship.bounty += 1000
            relationship.save
            puts "Your bounty is now #{relationship.bounty}.".colorize(:light_red)
            sleep(1)
        elsif input == '3'
            puts "You get sick of the guards bugging you and tell the Jarl to clear your bounty.\n".colorize(:yellow)
            relationship.bounty = 0
            relationship.save
            puts "Your bounty is now #{relationship.bounty}.".colorize(:yellow)
            sleep(1)
        end
    end


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
        puts "3.".colorize(:blue)+ " Look for Quests"+"            4.".colorize(:blue)+" Visit home" 
        puts "5.".colorize(:blue)+ " Ask Jarl about Thanehood"+"   6.".colorize(:blue)+ " Exit to Main Menu\n\n"
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
            title = <<-'EOF'

         (')) ^v^  _           (`)_
        (__)_) ,--j j-------, (__)_)
              /_.-.___.-.__/ \
            ,8| [_],-.[_] | oOo
        ,,,oO8|_o8_|_|_8o_|&888o,,,
            EOF

            puts title

            sleep(1.5)
            puts "\nAfter a good night's rest you reenter the streets of #{$current_location.name}.".colorize(:yellow)
            sleep(1.5)
            player_options
        elsif input == '5'
            puts "\nYou approach #{$current_location.jarl}'s throne and ask if you can become the Thane of #{$current_location.name}...".colorize(:yellow)
            sleep(1.5)
            if relationship.goodwill >= 1000
                puts "\n#{$current_location.jarl} considers your request and realizes you've helped #{$current_location.name} many times.".colorize(:yellow)
                sleep(1.5)
                puts "\n#{$current_location.jarl} tells you that you can become Thane of #{$current_location.name} if you'll complete one last quest.\nWill you accept?\n".colorize(:yellow)
                print "Y / N: ".colorize(:light_blue)
                input = gets.chomp.downcase
                if input == 'y'
                    relationship.thanehood = Relationship.thane_quest($current_player, $current_location)
                    relationship.save
                    player_options
                elsif input == 'n'
                    puts "\n#{$current_location.jarl} throws you out of the castle for wasting their time.\n".colorize(:red)
                    sleep(2)
                else
                    puts "\nINVALID INPUT".colorize(:red)
                    sleep(2)
                    player_options
                end
            else
                puts "\n#{$current_location.jarl} scoffs and tells you to come back after you've helped out around #{$current_location.name}.".colorize(:red)
                sleep(1.5)
            end
            player_options
        elsif input == '6'
            puts "\n"
            run
        else
            puts'Invalid input. Please try again.'
            player_options
        end
    end
    binding.pry
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