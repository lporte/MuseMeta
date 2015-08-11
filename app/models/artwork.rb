class Artwork < ActiveRecord::Base
	belongs_to :artist
	belongs_to :museum
	validates :title, presence: true
	validates :source, presence: true
	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]	
	# validates :date, presence: true

	include Paperclip::Glue

	attr_reader :artwork_remote_url
	has_attached_file :image

	  def avatar_remote_url=(url_value)
	    self.artwork_img = URI.parse(url_value)
	    # Assuming url_value is http://example.com/photos/face.png
	    # avatar_file_name == "face.png"
	    # avatar_content_type == "image/png"
	    @artwork_remote_url = url_value
	  end
end
