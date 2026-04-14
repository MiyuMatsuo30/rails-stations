# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

15.times do |no|
    Movie.create(:id => "#{no}", :name => "劇場版テック", :year => 2022, :description => "映画の説明", :image_url => "https://picsum.photos/id/237/200/300", :is_showing => true)
end