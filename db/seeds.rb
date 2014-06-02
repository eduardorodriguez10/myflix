# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: "Futurama", description: "The Futurama Movie", small_cover_url:"tmp/futurama.jpg", large_cover_url: "tmp/monk_large.jpg")
Video.create(title: "Family Guy", description: "The Family Guy Movie", small_cover_url:"tmp/family_guy.jpg", large_cover_url: "tmp/monk_large.jpg")
Video.create(title: "Monk", description: "The Super Monk", small_cover_url:"tmp/monk.jpg", large_cover_url: "tmp/monk_large.jpg")
Video.create(title: "South Park", description: "The South Park Parking Park", small_cover_url:"tmp/south_park.jpg", large_cover_url: "tmp/monk_large.jpg")
Category.create(name: "Comedy")
Category.create(name: "Drama")
video = Video.find_by(title: "Futurama")
comedy = Category.find_by(name: "Comedy")
drama = Category.find_by(name: "Drama")
video.category_id = comedy.id 
video.save 
video = Video.find_by(title: "Family Guy")
video.category_id = comedy.id 
video.save 
video = Video.find_by(title: "South Park")
video.category_id = comedy.id 
video.save 
video = Video.find_by(title: "Monk")
video.category_id = drama.id 
video.save 
