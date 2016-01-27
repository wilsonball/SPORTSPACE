class PagesController < ApplicationController
  before_filter :disable_nav, only: [:home]

  def home
  end

  def search
    @search = Court
      .joins('LEFT OUTER JOIN runs ON runs.court_id = courts.id')
      .select("courts.*, count(runs.id) as num_runs")
      .group("courts.id")


    if params[:coords].present? && params[:coords].strip != ""
      if params[:coords] =~ /-?\d+(\.\d+)?,-?\d+(\.\d+)?/
        location = params[:coords].split(',').map{|num| Float(num)}
        @search = @search.near(location, 25, order: 'distance')
      end
    else
      @search = @search.near(params[:address], 25, order: 'distance')
      
    end



  	# if params[:address].present? && params[:address].strip != ""
   #    if params[:address] =~ /-?\d+(\.\d+)?,-?\d+(\.\d+)?/
   #      location = params[:address].split(',').map{|num| Float(num)}
   #    else
   #      if params[:coords] =~ /-?\d+(\.\d+)?,-?\d+(\.\d+)?/
   #      location = params[:coords].split(',').map{|num| Float(num)}
   #      else
   #        location = params[:coords]
   #      end
   #    end
   #    @search = @search.near(location, 25, order: 'distance')
  	# end

    # if params[:coords].present? && params[:coords].strip != ""
    #   if params[:coords] =~ /-?\d+(\.\d+)?,-?\d+(\.\d+)?/
    #     location = params[:coords].split(',').map{|num| Float(num)}
    #   else
    #     location = params[:coords]
    #   end

    #   @search = @search.near(location, 25, order: 'distance')
    # end

    if params[:time].present? && params[:time].strip != ""
      @search = @search
        .where("runs.start_time <= ? AND runs.end_time >= ?", params[:time], params[:time])
       
    end

    #if params[:name].present? && params[:name].strip != ""
      #puts "adding name search"
      @search = @search
        .ransack(listing_name_cont: params[:name])
      @search = @search
        .result
        .ransack(params[:q])


    #end



    arrResult = Array.new

  	@courts = @search.result.paginate(:page => params[:page], :per_page => 10, :total_entries => 500)
    # @search_name = @courts_listing_name.ransack(params[:q])

  	@arrCourts = @courts.to_a


  end



end
