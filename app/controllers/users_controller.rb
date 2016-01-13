class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@courts = @user.courts
		@runs = @user.runs
		@photos = @user.photos
	end
end