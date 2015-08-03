10.times do 
	user = User.create(
		username: Faker::Name.name,
		password: Faker::Internet.password(6),
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		city: Faker::Address.city,
		state: Faker::Address.state,
		bio: Faker::Company.catch_phrase,
		avatar: Faker::Avatar.image
	)
end

10.times do
	Artwork.create(
		title: Faker::Hacker.noun, 
		source: Faker::Hacker.adjective, 
		date: Faker::Date.backward(40000),
		img_url: ["http://33.media.tumblr.com/69955b22a877b2964dcdeb4022f66b8d/tumblr_mxmi1q5glS1rt28efo1_r1_500.gif","http://zillionarts.com/wp-content/uploads/2011/03/510.jpg", "http://www.zimmerlimuseum.rutgers.edu/sites/zimmerli/files/img/PE_Lichtenstein_D.jpg", "http://oil-paintings.biz/images/oil-paintings/andrew-wyeth/andrew-wyeth-christinas-world-15366.jpg", "http://www.dailyartfixx.com/wp-content/uploads/2009/12/tenor-basquiat-1985.jpg", "http://baterbys.com/wp-content/uploads/2014/03/Leonor-Fini-Le-Bout-du-monde.jpg"].sample,
		artist_id: rand(1..10),
		museum_id: rand(1..10)
		)
end

10.times do
	Museum.create(name: "Museum of " + Faker::Company.name,
		location: Faker::Address.city)	
end

10.times do
	Artist.create(name: Faker::Name.name,
		bio: ["My work explores the relationship between the Military-Industrial Complex and vegetarian ethics.", "With influences as diverse as Rousseau and Roy Lichtenstein, new tensions are manufactured from both constructed and discovered textures.", "Ever since I was a pre-adolescent I have been fascinated by the unrelenting divergence of the moment. What starts out as triumph soon becomes corroded into a dialectic of power, leaving only a sense of dread and the dawn of a new beginning.", "As shimmering forms become transformed through studious and repetitive practice, the viewer is left with an insight into the possibilities of our culture.", "As spatial forms become distorted through studious and academic practice, the viewer is left with a clue to the darkness of our culture."].sample )
end

10.times do 
	Relationship.create(artist_id: rand(1..10), 
		museum_id: rand(1..10))
end