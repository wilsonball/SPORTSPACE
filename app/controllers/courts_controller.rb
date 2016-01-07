class CourtsController < ApplicationController

  before_action :set_court, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @courts = Court.all
  end

  def show
    @photos = @court.photos

    @reviews = @court.reviews
    
  end

  def new
    @court = current_user.courts.build
  end

  def create
    @court = current_user.courts.build(court_params)

      if @court.save

        if params[:images]
          params[:images].each do |image|
            @court.photos.create(image: image)
          end
        end

        @photos = @court.photos
        redirect_to court_path(@court), notice: "Saved!"
      else
        flash[:alert] = "Please provide all information for this court."
        render :new
      end
  end

  def edit
    if current_user.id == @court.user.id
      @photos = @court.photos
    else
      redirect_to root_path, notice: "You don't have permission!"
    end
  end

  def update
    if @court.update(court_params)

      if params[:images]
        params[:images].each do |image|
          @court.photos.create(image: image)
        end
      end  
      redirect_to court_path, notice: "Updated!"
    else
      render :edit
    end
  end

  private
    def set_court
      @court = Court.find(params[:id])
    end

    def court_params
      params.required(:court).permit(:court_type, :court_floor, :court_count, :listing_name, :summary, :address, :is_3pt, :is_ncaa3pt, :is_nba3pt, :is_centercircle, :is_key, :is_freethrowline, :is_active, :price)
    end
end
