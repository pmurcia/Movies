# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
i= Imdb::Search.new('Red')
movies = i.movies
selected_movies = movies[0...5]
selected_movies.each do |a|
	@movie = Movie.create({title: a.title, poster: a.poster, plot: a.plot_summary, year: a.year})
	a.cast_members.each do |member|
		my_member = CastMember.find_or_create_by(full_name: member)
		@movie.cast_members << my_member
	end
	
end