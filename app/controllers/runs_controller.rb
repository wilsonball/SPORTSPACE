class RunsController < ApplicationController
	before_action :authenticate_user!

	def preload
		court = Court.find(params[:court_id])
		today = Date.today
		runs = court.runs.where("start_time >= ? OR end_time >= ?", today, today)

		render json: runs

	end

	def create
		@run = current_user.runs.create(run_params)

		redirect_to @run.court, notice: "Your available time has been set!"
	end

	private
		def run_params
			params.require(:run).permit(:start_time, :end_time, :price, :total, :court_id)
		end
end
