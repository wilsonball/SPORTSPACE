class SeengamesController < ApplicationController
	before_action :authenticate_user!

	def create
		@seengame = current_user.seengames.create(seengame_params)

		redirect_to @seengame.court, notice: "Thanks for submitting!"
	end

	def upvote 
	  @seengame = Seengame.find(params[:id])
	  @seengame.upvote_by current_user
	  redirect_to :back
	end  

	def downvote
	  @seengame = Seengame.find(params[:id])
	  @seengame.downvote_by current_user
	  redirect_to :back
	end

	private
		def seengame_params
			params.require(:seengame).permit(:games, :court_id)
			
		end
end
