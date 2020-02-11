require_relative '../config/environment'
#require '../db/seeds.rb'
$current_player = nil
$current_location = nil

#after creating character... find way to login with that character. 

def run
    binding.pry
    welcome
    selection_menu #choose to create a character or login to pre-existing character
    player_options #a list of options the selected player from 'selection_menu' can accomplish

end

def login()
    puts "Enter your name"
    name = gets.chomp
    if Player.find_by(:name => name) == false 
        p "This player doesn't exist"
        login()
    else
        $current_player = Player.find_by(:name => name)
        p "Welcome to Skyrim #{$current_player.name}"
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
    p '░██████╗██╗░░██╗██╗░░░██╗██████╗░██╗███╗░░░███╗  ░██████╗██╗███╗░░░███╗'
    p '██╔════╝██║░██╔╝╚██╗░██╔╝██╔══██╗██║████╗░████║  ██╔════╝██║████╗░████║'
    p '╚█████╗░█████═╝░░╚████╔╝░██████╔╝██║██╔████╔██║  ╚█████╗░██║██╔████╔██║'
    p '░╚═══██╗██╔═██╗░░░╚██╔╝░░██╔══██╗██║██║╚██╔╝██║  ░╚═══██╗██║██║╚██╔╝██║'
    p '██████╔╝██║░╚██╗░░░██║░░░██║░░██║██║██║░╚═╝░██║  ██████╔╝██║██║░╚═╝░██║'
    p '╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═╝░░░░░╚═╝  ╚═════╝░╚═╝╚═╝░░░░░╚═╝'
    puts "\n\n\t\t\t\   Welcome to Skyrim\n\n"
end

def main_menu
    puts "Main Menu"
    puts "Please select one of the following options:"
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
    puts "  ---CHARACTER CREATION---"
    print "\n1) Input a name for your character:  "
    name = gets.chomp
    print "\n2) Input the gender for your character:  "
    gender = gets.chomp.capitalize
    puts "\n3) Select your race:\n
    1. High Elf    2. Argonian    3. Wood Elf    4. Breton    5. Dark Elf\n
    6. Imperial    7. Khajiit     8. Nord        9. Orc       10. Redguard\n\n"
    print "enter number: "
    race = races[(gets.chomp.to_i - 1)]
    binding.pry
    new_player = Player.find_or_create_by(:name => name, :gender => gender, :race => race, :money => 0, :location => Town.all.first.id)
    p new_player
    $current_player = Player.find_by(:name => name)
    puts "You awake in Riften"
    #binding.pry


    rel1 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: riften.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel2 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: windhelm.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel3 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: winterhold.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel4 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: whiterun.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel5 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: falkreath.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel6 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: markarth.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel7 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: dawnstar.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel8 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: morthal.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    rel9 = Relationship.find_or_create_by(player_id: $current_player.id, town_id: solitude.id, thanehood: false, bounty: 0, goodwill: 0, home: false)
end

def login()
    puts "Enter your name"
    name = gets.chomp
    if Player.find_by(:name => name) == false 
        p "This player doesn't exist"
        login()
    else
        $current_player = Player.find_by(:name => name)
        p "Welcome to Skyrim #{$current_player.name}"
    end
end

def player_options
    $current_location = Town.find($current_player.location)
    p "Logged in as: #{$current_player.name}"
    p "You are currently in #{$current_location.name}"

    #For interactions should we make it so that we show all interactions possible in that location
    #since interactions class does not specify town location... we have to use npc.id and then get the npc.town_id 
    puts "\nWhat do you want to do\n
    1. Interact with citizens    2. Travel to another city    3. Return to Main Menu\n\n"
    print "enter number: "
    input = gets.chomp
    if input == '1'
        interact_with_citizens
    elsif input == '2'
        travel_menu
    elsif input == '3'
        main_menu
    else
        p 'Invalid input. Please try again.'
        player_options
    end
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

    p 'You see the following citizens:'
    p "1. #{names[0]}   2. #{names[1]}"
    p "3. #{names[2]}   4. #{names[3]}"
    p "5. Exit"

    input = gets.chomp


    if input == '1'
        p "1. Kill #{names[0]}"
        p "2. Talk to #{names[0]}"
        input2 = gets.chomp
        if input2 == '1'
            p x[0].description
            relationship.bounty += x[0].bounty
            p "Your bounty is #{relationship.bounty}"
        elsif input2 == '2'
            p x[1].description
        else
            p 'Invalid input. Please try again'
            interact_with_citizens
        end
    elsif input == '2'
        p "1. Kill #{names[1]}"
        p "2. Talk to #{names[1]}"
        input2 = gets.chomp
        if input2 == '1'
            p x[2].description
            relationship.bounty += x[0].bounty
            p "Your bounty is #{relationship.bounty}"
        elsif input2 == '2'
            p x[3].description
        else
            p 'Invalid input. Please try again'
            interact_with_citizens
        end
    elsif input == '3'
        p "1. Kill #{names[2]}"
        p "2. Talk to #{names[2]}"
        input2 = gets.chomp
        if input2 == '1'
            p x[4].description
            relationship.bounty += x[0].bounty
            p "Your bounty is #{relationship.bounty}"
        elsif input2 == '2'
            p x[5].description
        else
            p 'Invalid input. Please try again'
            interact_with_citizens
        end
    elsif input == '4'
        p "1. Kill #{names[3]}"
        p "2. Talk to #{names[3]}"
        input2 = gets.chomp
        if input2 == '1'
            p x[6].description
            relationship.bounty += x[0].bounty
            p "Your bounty is #{relationship.bounty}"
        elsif input2 == '2'
            p x[7].description
        else
            p 'Invalid input. Please try again'
            interact_with_citizens
        end
    elsif input == '5'
        player_options
    else
        p '*******************************'
        p 'Invalid input. Please try again'
        p '*******************************'
        interact_with_citizens
    end
end




def enter_city(user_input_number)
    arr = ["Riften", "Windhelm", "Winterhold", "Whiterun", "Falkreath", "Markarth", "Dawnstar", "Morthal", "Solitude"]
    puts "The super cool logo thing"
    puts "Where do you want to go?"
    puts "\n3) Select your city:\n
    1. Riften    2. Windhelm    3. Winterhold    4. Whiterun    5. Falkreath\n
    6. Markarth    7. Dawnstar     8. Morthal        9. Solitude\n\n"
    print "enter number: "
    choice = arr[(gets.chomp.to_i - 1)]
end

def visit_city(name)
    puts "You have arrived to #{name}"

end

# def riften
#     puts '▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀█ ░▀░ █▀▀ ▀▀█▀▀ █▀▀ █▀▀▄ '
#     puts '▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▄▄▀ ▀█▀ █▀▀ ░░█░░ █▀▀ █░░█ '
#     puts '▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░▒█ ▀▀▀ ▀░░ ░░▀░░ ▀▀▀ ▀░░▀ '
# end

run

# binding.pry
# 0