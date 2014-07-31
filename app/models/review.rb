class Review < ActiveRecord::Base
	belongs_to :movie
	validates :reviewer, presence: true
	validates :content, presence: true
end
