class RunsController < ApplicationController
	before_action :authenticate_user!

	def preload

	end

	def create
		@run = current_user.runs.create(run_params)

		redirect_to @run.court, notice: "Your available time has been set!"
	end

	private
		def run_params
			params.require(:run).permit(:start, :end, :price, :total, :court_id)
		end
end
