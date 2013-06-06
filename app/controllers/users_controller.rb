class UsersController < ApplicationController

	def show
		@friend = User.find_by_identifier(params[:identifier])
	end

end