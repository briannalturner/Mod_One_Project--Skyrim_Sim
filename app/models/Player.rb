class Player < ActiveRecord::Base
    has_many :relationships
    has_many :towns, through: :relationships
    
    def enter_city(user_input_number)
        arr = ["Riften", "Windhelm", "Winterhold", "Whiterun", "Falkreath", "Markarth", "Dawnstar", "Morthal", "Solitude"]
        puts "The super cool logo thing"
        puts "Where do you want to go?"
        puts "\n3) Select your city:\n
        1. Riften    2. Windhelm    3. Winterhold    4. Whiterun    5. Falkreath\n
        6. Markarth    7. Dawnstar     8. Morthal        9. Solitude\n\n"
        print "enter number: "
        choice = arr[(gets.chomp.to_i - 1)]
        self.location = Town.find_by(name: choice).id
        binding.pry
    end
end
