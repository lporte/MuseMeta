class Artist < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    has_many :artworks

    def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    	where("name like ?", "%#{query}%").first
	end

	def self.assoc_artworks(name)
		artist = Artist.where("name like ?", "%#{name}%").first
		@assoc_art = artist.artworks if artist.present?
	end
end
