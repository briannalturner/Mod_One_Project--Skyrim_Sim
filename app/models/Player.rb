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
    
    def add_relationships(person_id)
        rel1 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[0].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel2 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[1].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel3 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[2].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel4 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[3].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel5 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[4].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel6 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[5].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel7 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[6].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel8 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[7].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
        rel9 = Relationship.find_or_create_by(player_id: person_id, town_id: Town.all[8].id, thanehood: false, bounty: 0, goodwill: 0, home: false)
    end

    #helper method to see an array of all relationships the instance player has
    def get_relationships
        Relationship.all.select { |instance| instance.player_id == self.id }
    end
end
