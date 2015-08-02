class Artist < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    has_many :museums, through: :relationships
    has_many :relationships
    has_many :artworks
end
