class Town < ActiveRecord::Base
    has_many :relationships
    has_many :players, through: :relationships
    has_many :npcs
    has_many :interactions, through: :npcs
    has_many :quests


    def get_npcs_for_city
        Interaction.all.where('self.id == town_id')
    end

    def get_interactions_for_city
        get_npcs_for_city(self.id)
    end

end

binding.pry
0