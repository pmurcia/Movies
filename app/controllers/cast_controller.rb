class CastController < ApplicationController
	def show
		@cast = CastMember.find params[:id]
	end
end
