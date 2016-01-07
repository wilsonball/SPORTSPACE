class PagesController < ApplicationController
  def home
  	@courts = Court.all
  end

  def search
    @search = Court
      .where(is_active: true)
      .joins('LEFT OUTER JOIN runs ON runs.court_id = courts.id')
      .select("courts.*, count(runs.id) as num_runs")
      .group("courts.id")
  	if params[:address].present? && params[:address].strip != ""
      #puts "adding address search"
  		@search = @search
        .near(params[:address], 5, order: 'distance')
      result = request.location
      puts "result"
      myIP = "73.15.91.27"

  	end

    if params[:time].present? && params[:time].strip != ""
      @search = @search
        .where("runs.start <= ? AND runs.end >= ?", params[:time], params[:time])
    end

    #if params[:name].present? && params[:name].strip != ""
      #puts "adding name search"
      @search = @search
        .ransack(listing_name_cont: params[:name])
      @search = @search.result
        .ransack(params[:q])
    #end



    arrResult = Array.new

  	@courts = @search.result
    # @search_name = @courts_listing_name.ransack(params[:q])

  	@arrCourts = @courts.to_a


  end



end