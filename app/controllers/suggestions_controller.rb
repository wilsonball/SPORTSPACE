class SuggestionsController < ApplicationController

	def new

		
	end

	def create
		
	end
	private

		def suggestion_params
			params.require(:suggestion).permit(:title, :comment)
		
		end
	
end
