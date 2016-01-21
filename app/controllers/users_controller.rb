class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@userphotos = @user.userphotos
	end
end
