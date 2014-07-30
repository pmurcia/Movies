class Movie < ActiveRecord::Base
	 has_and_belongs_to_many :cast_members
	def self.last_updated_movies(number)
		Movie.limit(number).order(created_at: :desc)
	end
end
