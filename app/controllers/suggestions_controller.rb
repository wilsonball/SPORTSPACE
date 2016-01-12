class SuggestionsController < ApplicationController
	before_action :authenticate_user!

	def new
		@suggestion = current_user.suggestions.new(suggestion_params)

		
	end

	def create
		@suggestion = current_user.suggestions.new(suggestion_params)
		
	end
	private

		def suggestion_params
			params.require(:suggestion).permit(:title, :comment)
		
		end
	
end
