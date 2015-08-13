class Artwork < ActiveRecord::Base
	belongs_to :artist
	belongs_to :museum
	validates :title, presence: true
	validates :source, presence: true
	
end
