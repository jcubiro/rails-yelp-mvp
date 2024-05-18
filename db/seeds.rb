# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

restaurants = [
  { name: "Golden Dragon", address: "123 Main St", category: "chinese" },
  { name: "Bella Italia", address: "456 Elm St", category: "italian" },
  { name: "Sakura Sushi", address: "789 Oak St", category: "japanese" },
  { name: "Le Bistro", address: "101 Maple St", category: "french" },
  { name: "Belgian Waffle House", address: "202 Pine St", category: "belgian" }
]

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end

# Output the number of records created
puts "Created #{Restaurant.count} restaurants"

Restaurant.all.each do |restaurant|
  3.times do |i|
    restaurant.reviews.create!(
      content: "Review ##{i + 1} for #{restaurant.name}",
      rating: rand(0..5)
    )
  end
end

# Output the number of reviews created
puts "Created #{Review.count} reviews"
