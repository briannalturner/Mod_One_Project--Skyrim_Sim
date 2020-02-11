class Player < ActiveRecord::Base
    has_many :relationships
    has_many :towns, through: :relationships


end
