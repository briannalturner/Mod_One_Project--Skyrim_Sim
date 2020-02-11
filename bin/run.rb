require_relative '../config/environment'
#require '../db/seeds.rb'
require 'colorize'
require 'colorized_string'

$current_player = nil
$current_location = nil

#after creating character... find way to login with that character. 

def run
    welcome
    selection_menu #choose to create a character or login to pre-existing character
    player_options #a list of options the selected player from 'selection_menu' can accomplish

end

def login()
    puts "Enter your name"
    name = gets.chomp
    if Player.find_by(:name => name) == false 
        puts"This player doesn't exist"
        login()
    else
        $current_player = Player.find_by(:name => name)
        puts"Welcome to Skyrim #{$current_player.name}"
    end
end


def selection_menu
    selection = main_menu #input from main menu
    #binding.pry
    if selection == '1'
        login
    elsif selection == '2'
        create_character
    elsif selection == '3'
        exit
    else
      selection_menu
    end
end


def welcome
    puts "\n\n"
    puts'░██████╗██╗░░██╗██╗░░░██╗██████╗░██╗███╗░░░███╗  ░██████╗██╗███╗░░░███╗'.colorize(:light_blue)
    puts'██╔════╝██║░██╔╝╚██╗░██╔╝██╔══██╗██║████╗░████║  ██╔════╝██║████╗░████║'.colorize(:light_blue)
    puts'╚█████╗░█████═╝░░╚████╔╝░██████╔╝██║██╔████╔██║  ╚█████╗░██║██╔████╔██║'.colorize(:light_blue)
    puts'░╚═══██╗██╔═██╗░░░╚██╔╝░░██╔══██╗██║██║╚██╔╝██║  ░╚═══██╗██║██║╚██╔╝██║'.colorize(:light_blue)
    puts'██████╔╝██║░╚██╗░░░██║░░░██║░░██║██║██║░╚═╝░██║  ██████╔╝██║██║░╚═╝░██║'.colorize(:light_blue)
    puts'╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═╝░░░░░╚═╝  ╚═════╝░╚═╝╚═╝░░░░░╚═╝'.colorize(:light_blue)
    puts "\n\n\t\t\t\   Welcome to Skyrim\n\n".colorize(:blue)
end

def main_menu
    puts "Main Menu".colorize(:light_red)
    puts "Please select one of the following options:".colorize(:light_red)
    puts "\n"
    puts "1. Login"
    puts "2. Create a new character"
    puts "3. Exit program"
    #maybe add a future puts statement for showing the current accounts?
    x = gets.chomp
    return x
    
    #create character/login
    #name of who you are logged in as and where you are...
end

def create_character
    races = ['High Elf', 'Argonian', 'Wood Elf', 'Breton', 'Dark Elf', 'Imperial', 'Khajiit', 'Nord', 'Orc', 'Redguard']
    puts "  ---CHARACTER CREATION---".colorize(:blue)
    print "\n1) Input a name for your character:  ".colorize(:light_red)
    name = gets.chomp
    print "\n2) Input the gender for your character:  ".colorize(:light_red)
    gender = gets.chomp.capitalize
    puts "\n3) Select your race:\n
    1. High Elf    2. Argonian    3. Wood Elf    4. Breton    5. Dark Elf\n
    6. Imperial    7. Khajiit     8. Nord        9. Orc       10. Redguard\n\n".colorize(:light_red)
    print "enter number: ".colorize(:light_red)
    race = races[(gets.chomp.to_i - 1)]
    # binding.pry
    new_player = Player.find_or_create_by(:name => name, :gender => gender, :race => race, :money => 0, :location => Town.all[0].id)
    puts new_player
    $current_player = Player.find_by(:name => name)
    puts "\nYou awake in Riften\n".colorize(:blue)
    #binding.pry

    rel1 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[0].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel2 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[1].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel3 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[2].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel4 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[3].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel5 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[4].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel6 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[5].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel7 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[6].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel8 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[7].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel9 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: Town.all[8].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
end

def login()
    puts "****************".colorize(:light_red)
    puts "Enter your name:".colorize(:light_red)
    puts "\n"
    name = gets.chomp
    if Player.find_by(:name => name) == false 
        puts"This player doesn't exist".colorize(:light_red)
        login()
    else
        $current_player = Player.find_by(:name => name)
        puts "\n"
        puts "********************************************************************************\n\n".colorize(:light_red)
        puts '▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀▀█ █░█ █░░█ █▀▀█ ░▀░ █▀▄▀█'.colorize(:light_blue)
        puts '▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ░▀▀▀▄▄ █▀▄ █▄▄█ █▄▄▀ ▀█▀ █░▀░█'.colorize(:light_blue)
        puts '▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█▄▄▄█ ▀░▀ ▄▄▄█ ▀░▀▀ ▀▀▀ ▀░░░▀'.colorize(:light_blue)
        puts "\n"
    end
    current_id = $current_player.id
    $current_player.add_relationships(current_id)
end


def player_options
    $current_location = Town.find($current_player.location)
    puts"Logged in as: #{$current_player.name}".colorize(:blue)
    puts"You are currently in #{$current_location.name}.".colorize(:blue)

    #For interactions should we make it so that we show all interactions possible in that location
    #since interactions class does not specify town location... we have to use npc.id and then get the npc.town_id 
    puts "\nWhat do you want to do?\n
    1. Interact with citizens    2. Travel to another city    3. Look for Quests    4. Return to Main Menu\n\n".colorize(:light_red)
    print "Enter Number: ".colorize(:light_red)
    input = gets.chomp
    if input == '1'
        interact_with_citizens
    elsif input == '2'
        travel_menu
    elsif input == '3'
        quest_method
    elsif input == '4'
        main_menu
    else
        puts'Invalid input. Please try again.'.colorize(:light_red)
        player_options
    end
end

def travel_menu
    towns = [Town.all[0], Town.all[1], Town.all[2] ,Town.all[3], Town.all[4], Town.all[5] ,Town.all[6], Town.all[7], Town.all[8]]
    puts "\nWhich city do you want to travel to?\n".colorize(:light_red)
    puts "  1. #{towns[0].name}     2. #{towns[1].name}     3. #{towns[2].name}\n".colorize(:light_red)
    puts "  4. #{towns[3].name}     5. #{towns[4].name}     6. #{towns[5].name}\n".colorize(:light_red)
    puts "  7. #{towns[6].name}     8. #{towns[7].name}     9. #{towns[8].name}\n".colorize(:light_red)
    print "Enter Number:  ".colorize(:light_red)
    input = gets.chomp.to_i
    $current_location = towns[input - 1]

    #updating the current_player location... So that the next time we reach player_options menu... the location is correct.
    $current_player.location = $current_location.id
    player_options
end

def interact_with_citizens
    x = Interaction.all.select { |inst|
        inst.town_id == $current_player.location
    }
    # gives npc instances
    names = $current_location.get_npcs_for_city.map { |npc|
        npc.name
    }
    relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)

    puts'You see the following citizens:'.colorize(:light_red)
    puts"1. #{names[0]}   2. #{names[1]}".colorize(:light_red)
    puts"3. #{names[2]}   4. #{names[3]}".colorize(:light_red)
    puts"5. Exit".colorize(:light_red)

    input = gets.chomp

    if input == '1'
        puts"1. Kill #{names[0]}".colorize(:light_red)
        puts"2. Talk to #{names[0]}".colorize(:light_red)
        input2 = gets.chomp
        if input2 == '1'
            puts x[0].description
            relationship.bounty += x[0].bounty
            puts"Your bounty is #{relationship.bounty}".colorize(:light_red)
            interact_with_citizens
        elsif input2 == '2'
            puts x[1].description
            interact_with_citizens
        else
            puts'Invalid input. Please try again'.colorize(:light_red)
            interact_with_citizens
        end
    elsif input == '2'
        puts"1. Kill #{names[1]}".colorize(:light_red)
        puts"2. Talk to #{names[1]}".colorize(:light_red)
        input2 = gets.chomp
        if input2 == '1'
            puts x[2].description
            relationship.bounty += x[0].bounty
            puts "Your bounty is #{relationship.bounty}".colorize(:light_red)
            interact_with_citizens
        elsif input2 == '2'
            puts x[3].description
            puts "\n\n"
            interact_with_citizens
        else
            puts'Invalid input. Please try again'.colorize(:light_red)
            interact_with_citizens
        end
    elsif input == '3'
        puts"1. Kill #{names[2]}".colorize(:light_red)
        puts"2. Talk to #{names[2]}".colorize(:light_red)
        input2 = gets.chomp
        if input2 == '1'
            puts x[4].description
            relationship.bounty += x[0].bounty
            puts"Your bounty is #{relationship.bounty}".colorize(:light_red)
            interact_with_citizens
        elsif input2 == '2'
            puts x[5].description
            interact_with_citizens
        else
            puts'Invalid input. Please try again'.colorize(:light_red)
            interact_with_citizens
        end
    elsif input == '4'
        puts"1. Kill #{names[3]}".colorize(:light_red)
        puts"2. Talk to #{names[3]}".colorize(:light_red)
        input2 = gets.chomp
        if input2 == '1'
            puts x[6].description
            relationship.bounty += x[0].bounty
            puts"Your bounty is #{relationship.bounty}".colorize(:light_red)
            interact_with_citizens
        elsif input2 == '2'
            puts x[7].description
            interact_with_citizens
        else
            puts'Invalid input. Please try again'.colorize(:light_red)
            interact_with_citizens
        end
    elsif input == '5'
        player_options
    else
        puts'*******************************'.colorize(:light_red)
        puts'Invalid input. Please try again'.colorize(:light_red)
        puts'*******************************'.colorize(:light_red)
        interact_with_citizens
    end
end

def quest_method
    relationship = Relationship.find_by(:player_id => $current_player.id, :town_id => $current_location.id)
    q = Quest.all.sample
    q.town_id = $current_location.id
    puts q.description
    puts"The reward is #{q.reward} and the goodwill #{q.goodwill}"
    puts'1. Accept Quest  2. Reject Quest'
    input = gets.chomp
    puts "\n\n"
    if input == '1'
        puts "You depart for adventure to #{q.description.split(" ")[-1]}\n" #This returns name of place we are going to
        completion_chance = rand(0..100)
        #binding.pry
        if completion_chance > 60
            puts ". . .\n. . .\n"
            puts'You successfully completed the Quest.'
            $current_player.money += q.reward
            relationship.goodwill += q.goodwill
            puts"You now have #{$current_player.money} septims and you gained #{relationship.goodwill} goodwill."
            player_options
        else
            puts ". . .\n. . .\n"
            puts "Along the way you realize the challenge ahead of you and you say  '!@#$ it.' '"
            puts "With that you decide to head back to town"
            player_options
        end
    elsif input == '2'
        player_options
    end
end


def enter_city(user_input_number)
    arr = ["Riften", "Windhelm", "Winterhold", "Whiterun", "Falkreath", "Markarth", "Dawnstar", "Morthal", "Solitude"]
    puts "The super cool logo thing".colorize(:light_red)
    puts "Where do you want to go?".colorize(:light_red)
    puts "\n3) Select your city:\n
    1. Riften    2. Windhelm    3. Winterhold    4. Whiterun    5. Falkreath\n
    6. Markarth    7. Dawnstar     8. Morthal        9. Solitude\n\n".colorize(:light_red)
    print "enter number: ".colorize(:light_red)
    choice = arr[(gets.chomp.to_i - 1)]
end

def visit_city(name)
    puts "You have arrived in #{name}".colorize(:light_red)

end

def find_city_id_by_name(string)
    x = Town.all.select { |city|
        city.name == string
    }
    x.id
end

# def riften
#     puts '▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀█ ░▀░ █▀▀ ▀▀█▀▀ █▀▀ █▀▀▄ '
#     puts '▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▄▄▀ ▀█▀ █▀▀ ░░█░░ █▀▀ █░░█ '
#     puts '▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░▒█ ▀▀▀ ▀░░ ░░▀░░ ▀▀▀ ▀░░▀ '
# end

#run

binding.pry
0