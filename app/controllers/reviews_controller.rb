class ReviewsController < ApplicationController

	def index
		@reviews = Review.all
		
	end

	def create
		@review = current_user.reviews.create(review_params)
		if @review.save
			redirect_to @review.court, notice: "Thank you for writing a review!"
		else
			redirect_to @review.court, notice: "Missing rating or comment. Please try again!"
		end
	end

	def update
		
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