# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Tweeet.destroy_all

# Create sample tweets
tweets = [
  "Just set up my new Twitter clone with Mantine styling! #excited",
  "Learning Ruby on Rails is so much fun. The framework is very powerful!",
  "Does anyone have recommendations for good programming books? #coding #learning",
  "Working on a new project today. Can't wait to share the results!",
  "Coffee + coding = perfect morning"
]

tweets.each do |content|
  Tweeet.create!(tweeet: content)
end

puts "Created #{Tweeet.count} sample tweets"
