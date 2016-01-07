class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.court
	end

	def destroy
		@review = Review.find(params[:id])
		court = @review.court
		@review.destroy

		redirect_to court
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :court_id)
			
		end
end