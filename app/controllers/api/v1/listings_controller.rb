class Api::V1::ListingsController < ApplicationController
  before_action set_listing only: %(show,update,delete)

  def index
    @listings = Listing.all
    render json: @listings
  end

  def show
    render json: @listing
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: @listing
    else
      render json: { error: 'Unable to create listing.' }, status: 400
    end
  end

  def update
    @listing.update(listing_params)
    if @listing.save
      render json: @listing
    else
      render json: { error: 'Unable to create listing.' }, status: 400
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:num_room)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end
