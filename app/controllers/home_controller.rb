class HomeController < ApplicationController

	def index
		@schools = School.all
		render json: @schools
	end

end