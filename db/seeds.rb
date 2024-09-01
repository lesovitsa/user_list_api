# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(name: "Peter Steele", email: "type0negative@gmail.com", phone: "0000000000")
User.create(name: "Sully Erna", email: "godsmack@gmail.com", phone: "0000000001")
User.create(name: "Andi Derris", email: "helloween@gmail.com", phone: "0000000002")
User.create(name: "Paris Paloma", email: "paris_paloma@gmail.com", phone: "0000000003")