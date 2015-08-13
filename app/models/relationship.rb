class Relationship < ActiveRecord::Base
	belongs_to :artist
	belongs_to :museum
end