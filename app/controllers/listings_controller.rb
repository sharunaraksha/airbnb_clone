class ListingsController < ApplicationController 
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	attr_accessor :prop_type, :no_of_guests, :amenities

	def create
		@listing = current_user.listings.build(listing_params)
		
		#@listing.amenities.build(listing_params[:amenities_attributes])
		#@amenities=@listing.amenities.build
		
		if @listing.save #&& @amenities.save
			flash[:success] = "Listing Added!"
			redirect_to controller: 'pictures', action: 'new', listing_id: @listing.id
		else
			render 'new'
		end
	end

	def destroy
    	@listing.destroy
    	flash[:success] = "Listing deleted"
    	redirect_to request.referrer || root_url
    end

	def new
		@listing = Listing.new
        3.times { @listing.amenities.build }
        @listing.build_location

		@prop_type=['farmhouse','hotel','lakehouse', 'guest house']
		@no_of_guests=[1,2,3,4,5,6,7,8,9,10]
		@amenities=['WiFi','AC','Heater']
	end

	private
      
      def listing_params
      	params.require(:listing).permit(:property_type, :no_of_guests, :price_per_guest, :description, amenities_attributes: [ :id, :name, :description ,:_destroy],location_attributes: [ :id, :address, :city, :state, :country, :zip ])
      end

      def correct_user
      	@listing = current_user.listings.find_by(id: params[:id])
      	redirect_to root_url if @listing.nil?
      end

      #def lis
      #	params.require(:amenity).permit(amenitys_attributes: [ :id, :name, :description, :listing_id ])
      #end

end
