class ListingsController < ApplicationController
  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.new(
      name: "Hawaii Bungalo",
      slug: "hawaii-bungalo",
      price: 145
    )
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing.slug), notice: 'Listing was successfully created.' }
        format.json { render action: 'show', status: :created, location: listing_url(@listing.slug) }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def slugify(string)
      string.gsub! /\s*[^A-Za-z0-9]\s*/, '_'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :slug, :price)
    end
end
