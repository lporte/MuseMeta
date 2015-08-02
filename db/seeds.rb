10.times do 
	user = User.create(
		username: Faker::Name.name,
		# Needs to be password to be encrypted with bcrypt
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