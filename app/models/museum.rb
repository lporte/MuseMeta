class Museum < ActiveRecord::Base
    has_many :artists, through: :relationships
    has_many :relationships
    has_many :artworks
    validates :name, presence: true, uniqueness: true
end
