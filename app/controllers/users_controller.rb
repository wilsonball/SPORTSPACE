class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@courts = @user.courts
		@runs = @user.runs
		@userphotos = @user.userphotos
	end
end
