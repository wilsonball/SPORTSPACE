class SeengamesController < ApplicationController
	before_action :authenticate_user!

	def create
		@seengame = current_user.seengames.create(seengame_params)

		redirect_to @seengame.court, notice: "Thanks for submitting!"
	end

	private
		def seengame_params
			params.require(:seengame).permit(:games, :court_id)
			
		end
end
