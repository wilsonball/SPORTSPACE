class SeenplayersController < ApplicationController
	before_action :authenticate_user!

	def create
		@seenplayer = current_user.seenplayers.create(seenplayer_params)

		redirect_to @seenplayer.court, notice: "Thanks for submitting!"
	end

	private
		def seenplayer_params
			params.require(:seenplayer).permit(:players, :court_id)
			
		end
end
