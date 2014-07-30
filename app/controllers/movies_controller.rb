class MoviesController < ApplicationController
	def index
		@movies = Movie.last_updated_movies(5)
	end

	def show
		@movie = Movie.find params[:id]

		render layout: 'movie'
	end
	
end
