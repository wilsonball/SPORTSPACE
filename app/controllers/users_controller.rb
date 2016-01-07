class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@courts = @user.courts
	end
end