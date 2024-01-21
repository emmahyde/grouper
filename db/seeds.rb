# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Post.destroy_all

user1 = User.create!(name: 'Alice', email: 'alice@example.com', password: '1234', password_confirmation: '1234')
user2 = User.create!(name: 'Bob', email: 'bob@example.com', password: '1234', password_confirmation: '1234')
user3 = User.create!(name: 'Charlie', email: 'charlie@example.com', password: '1234', password_confirmation: '1234')

users = [user1, user2, user3]

users.each do |user|
  # Profiles are created automatically via active record hooks. Add some info
  profile = Profile.find_by(user_id: user.id)
  profile.update(description: "My name is #{user.name}, and this is my profile!",
slug: "Vibing! This is #{user.name}'s slug!")
  # Create some posts
  3.times do |i|
    Post.create!(text: "This is post number #{i + 1} by #{user.name}", user: user)
  end
  users.each do |friend|
    # Create friendship unless they are the same user
    Friendship.create!(user: user, friend: friend, mutual: true) unless user == friend
  end
end

puts 'Rite of Database Seeding Complete'
