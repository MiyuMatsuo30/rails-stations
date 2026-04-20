# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 3.times do |abc|
#     5.times do |no|
#         if abc+1 == 1
#             Sheet.create(:id => 5*abc+no+1, :column => no+1, :row => 'a')
#         elsif abc+1 == 2
#             Sheet.create(:id => 5*abc+no+1, :column => no+1, :row => 'b')
#         else
#             Sheet.create(:id => 5*abc+no+1, :column => no+1, :row => 'c')
#         end
#     end
# end
a=0

# [3,9,21,24,27].each do |mo|
#     5.times do |no|
#         Schedule.create(:id => a*5+no, :movie_id => mo, :start_time => "#{(5+(no+1))*2}:00:00", :end_time => "#{(5+(no+1))*2+2}:00:00")
#     end
#     a = a + 1
# end

