class MoviesController < ApplicationController
	def index
		@movies = Movie.last_updated_movies(5)
	end

	def show
		@movie = Movie.find params[:id]

		render layout: 'movie'
	end
	
	def edit
		@movie = Movie.find params[:id]
	end

	def update
		@movie = Movie.find params[:id]
		if @movie.update_attributes 
			redirect_to action: 'index', controller: 'movies', movie_id: @movie.id
		else
			flash[:alert] = "Something hasn't been OK..."
			
			@errors = @entry.errors.full_messages
			render 'edit'
		end
	end

	
end
