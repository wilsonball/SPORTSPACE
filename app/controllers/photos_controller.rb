class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		court = @photo.court

		@photo.destroy
		@photos = Photo.where(court_id: court.id)

		respond_to :js
	end
end