class SeenplayersController < ApplicationController
	before_action :authenticate_user!

	def create
		@seenplayer = current_user.seenplayers.create(seenplayer_params)

		redirect_to @seenplayer.court, notice: "Thanks for submitting!"
	end

	def upvote
		@seenplayer = Seenplayer.find(params[:id])
		@seenplayer.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@seenplayer = Seenplayer.find(params[:id])
		@seenplayer.downvote_by current_user
		redirect_to :back		
	end

	def score
		seenplayer.get_upvotes.size - seenplayer.get_downvotes.size
		
	end

	private
		def seenplayer_params
			params.require(:seenplayer).permit(:players, :court_id)
			
		end
end
