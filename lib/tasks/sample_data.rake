namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "Example User",
					 email: "example@example.com",
					 password: "foobar123",
					 password_confirmation: "foobar123")
		99.times do |n|
			name = Faker::Name.name
			email = "marathoner#{n+1}@moviemarathoners.com"
			password = "password"
			User.create!(name: name,
						 email: email,
						 password: password,
						 password_confirmation: password)
		end
	end
end