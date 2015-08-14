class Artwork < ActiveRecord::Base
	belongs_to :artist
	belongs_to :museum
	validates :title, presence: true, uniqueness: true
	validates :source, presence: true, uniqueness: true
	
end
