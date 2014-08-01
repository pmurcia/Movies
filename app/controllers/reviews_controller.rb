class ReviewsController < ApplicationController
	def index
		@movie = Movie.find params[:movie_id]
		@reviews = @movie.reviews
	end

	def new
		@movie = Movie.find params[:movie_id]
		@review = @movie.reviews.new
	end

	def create
		@movie = Movie.find params[:movie_id]
		@review = @movie.reviews.new review_params

		if @review.save
			redirect_to action: 'index', controller: 'reviews', movie_id: @movie.id
		else
			render 'new'
		end
	end

	def update
		@obj = Obj.find(params[:id])
		if @obj.update_attributes(params[:obj])
			rediredt_to'/obks/<@obj.id'
		else
			@errors = obj.errors.full_messages
			render 'edit'
		end
	end

	private

	def review_params
		params.require(:review).permit(:reviewer, :content)
	end


end
