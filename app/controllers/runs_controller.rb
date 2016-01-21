class RunsController < ApplicationController
	before_action :authenticate_user!

	def preload
		today = Date.today
		runs = court.runs.where("start_time >= ? OR end_time >= ?", today, today)

		render json: runs

	end

	def create
		@run = current_user.runs.create(run_params)

		if @run.save
			redirect_to @run.court, notice: "Your available time has been set!"
		else
			redirect_to @run.court, notice: "Missing Start or End Time. Please try again!"
		end
	end

	def update

	end

	def destroy
		@run = Run.find(params[:id])
		court = @run.court
		@run.destroy

		redirect_to @run.user
	end

	private
		def run_params
			params.require(:run).permit(:start_time, :end_time, :price, :total, :court_id)
		end
end
