require_relative '../config/environment'
$current_player = nil
$current_location = nil

def run
    welcome
    selection_menu
    options
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


#we don't have to implement this... this is from Ann's code
def selection_menu
    selection = main_menu #input from main menu
    #binding.pry
    if selection == '1'
        login
    elsif selection == '2'
        create_character
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
    new_player = Player.find_or_create_by(:name => name, :gender => gender, :race => race, :money => 0, :location => riften.id)
    p new_player
    $current_player = Player.find_by(:name => name)
    puts "You awake in Riften"

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

def options
    $current_location = Town.find($current_player.location)
    p "Logged in as: #{$current_player.name}"
    p "You are currently in #{$current_location.name}"
    p 'Options'
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

def riften
    puts '▒█░░▒█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█ 　 ▒█▀▀█ ░▀░ █▀▀ ▀▀█▀▀ █▀▀ █▀▀▄ '
    puts '▒█▒█▒█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█ 　 ▒█▄▄▀ ▀█▀ █▀▀ ░░█░░ █▀▀ █░░█ '
    puts '▒█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀ 　 ▒█░▒█ ▀▀▀ ▀░░ ░░▀░░ ▀▀▀ ▀░░▀ '
end

# run

binding.pry
0