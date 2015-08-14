# 10.times do 
# 	user = User.create(
# 		username: Faker::Name.name,
# 		password: Faker::Internet.password(6),
# 		first_name: Faker::Name.first_name,
# 		last_name: Faker::Name.last_name,
# 		email: Faker::Internet.email,
# 		city: Faker::Address.city,
# 		state: Faker::Address.state,
# 		bio: Faker::Company.catch_phrase,
# 		avatar: Faker::Avatar.image
# 	)
# end

# 10.times do
# 	Artwork.create(
# 		title: Faker::Hacker.noun, 
# 		source: Faker::Hacker.adjective, 
# 		date: Faker::Date.backward(40000),
# 		img_url: ["http://33.media.tumblr.com/69955b22a877b2964dcdeb4022f66b8d/tumblr_mxmi1q5glS1rt28efo1_r1_500.gif","http://zillionarts.com/wp-content/uploads/2011/03/510.jpg", "http://www.zimmerlimuseum.rutgers.edu/sites/zimmerli/files/img/PE_Lichtenstein_D.jpg", "http://oil-paintings.biz/images/oil-paintings/andrew-wyeth/andrew-wyeth-christinas-world-15366.jpg", "http://www.dailyartfixx.com/wp-content/uploads/2009/12/tenor-basquiat-1985.jpg", "http://baterbys.com/wp-content/uploads/2014/03/Leonor-Fini-Le-Bout-du-monde.jpg"].sample,
# 		artist_id: rand(1..10),
# 		museum_id: rand(1..10)
# 		)
# end

# 10.times do
# 	Museum.create(name: "Museum of " + Faker::Company.name,
# 		location: Faker::Address.city)	
# end

# 10.times do
# 	Artist.create(name: Faker::Name.name,
# 		bio: ["My work explores the relationship between the Military-Industrial Complex and vegetarian ethics.", "With influences as diverse as Rousseau and Roy Lichtenstein, new tensions are manufactured from both constructed and discovered textures.", "Ever since I was a pre-adolescent I have been fascinated by the unrelenting divergence of the moment. What starts out as triumph soon becomes corroded into a dialectic of power, leaving only a sense of dread and the dawn of a new beginning.", "As shimmering forms become transformed through studious and repetitive practice, the viewer is left with an insight into the possibilities of our culture.", "As spatial forms become distorted through studious and academic practice, the viewer is left with a clue to the darkness of our culture."].sample )
# end

# 10.times do 
# 	Relationship.create(
# 		artist_id: rand(1..10), 
# 		museum_id: rand(1..10))
# end

# TO DO:  SEED DATABASE
# class MuseumStuff
# 	include HTTParty

# 	base_uri 'https://api.collection.cooperhewitt.org/rest/'

# 	def get_pictures 
# 		response = self.class.get("/",
# 			:query => { 
# 				:method => "cooperhewitt.objects.getImages",
# 				:access_token => ENV["ACCESS_TOKEN"],
# 				:object_id => "18667413" 
# 			}
# 		)
# 	end

# 	def get_items_on_display
# 		response = self.class.get("/",
# 			:query => {
# 				:method => "cooperhewitt.objects.getOnDisplay",
# 				:access_token => ENV["ACCESS_TOKEN"],
# 			}
# 		)
# 	end

# end

# test_artwork = MuseumStuff.new
# test_images = Artwork.new
# ap test_artwork.get_items_on_display[:objects][0].each do |k, v|
# 	ap test_artwork.get_items_on_display[:objects][0][k][:title]
# end
# @artworks = []
# test_artwork.get_pictures["images"][0].each do |k, v|
# 	@artworks << test_artwork.get_pictures["images"][0][k]["url"]
# end

# @artworks.each do |artwork|
# 	test_images.avatar_remote_url(artwork)
# end
# test_artwork.avatar_remote_url()

# curl -X GET 'https://api.collection.cooperhewitt.org/rest/?
# method=cooperhewitt.objects.getImages&
# access_token=8983a6ba36768682cfcda354deb415e2&
# object_id=18667413'
class MetMuseum
	include HTTParty

	base_uri 'scrapi.org/search'
	def get_artwork
		response = self.class.get('/American+Painting?fields=title,primaryArtistNameOnly,primaryImageUrl,medium')
	end
end

test = MetMuseum.new

title = ""
source = ""
medium = ""
date = ""
img_url = ""
artist_id = ""

test.get_artwork["collection"]["items"].each do |item|
	item.each do |k, v|

		title = v if k == "title"
		source = v if k == "website_href"
		medium = v if k == "medium"
		date = v if k == "dateText"
		img_url = v if k == "image_thumb"
		artist_id = Artist.find_by(name: v).id if k == "primaryArtistNameOnly"

		# if k == "primaryArtistNameOnly"
		# 	if Artist.find_by(name: v).nil?
		# 		@artist = Artist.create(name: v)
		# 	else
		# 		@artist = Artist.find_by(name: v)
		# 	end
		# end
	end

	Artwork.create(
			title: title, 
			source: source,
			medium: medium,
			date: date,
			img_url: img_url,
			artist_id: artist_id
	)
end

# Psudeocode:
# images should be saved in image folder with the artwork id + title as its name
# Create new Artwork object with the following attr:  
  # title, source (website url), medium, date, img url, artist_id
# Create a new Artist object with the following attr:  
  #  name, bio

# Create a new Museum object for the Met...

# cat_urls = ['http://dreamatico.com/data_images/kitten/kitten-2.jpg',
#  		'http://s3.amazonaws.com/rapgenius/cats-animals-kittens-background.jpg', 
#  		'http://frenchpresspodcast.com/wp-content/uploads/2015/02/cute-kitten-is-leighton.jpg']

# cat_name = [ "ruby" , "rubert" , "rubensin"]

# cat_urls.each_with_index do |cat_url, i|
# 	`wget -O images/ #{cat_name[i]}.jpg #{cat_url}`
# end



