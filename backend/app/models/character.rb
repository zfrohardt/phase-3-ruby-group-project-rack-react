class Character < ActiveRecord::Base
    has_many :relationships
    has_many :spells, through: :relationships
end