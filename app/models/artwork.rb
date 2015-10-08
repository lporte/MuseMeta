class Artwork < ActiveRecord::Base
	belongs_to :artist
	validates :title, presence: true, uniqueness: true
	validates :source, presence: true, uniqueness: true
	
	def self.search(query)
    	where("title like ? OR medium like ? OR date like ?", "%#{query}%", "%#{query}%", "%#{query}%") 
    	# Model.where("name LIKE ? OR last_name LIKE ? OR first_name LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
	end

end
