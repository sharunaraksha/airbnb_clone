class BookingsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	attr_accessor :no_of_guests

	def create
		
		@booking = current_user.bookings.build(booking_params)

			if is_available? == 0
				if @booking.save
					redirect_to root_url
				else
			        render 'new'
		        end
			    flash[:success] = "Room has been booked!"
		    else
		        flash[:danger] = "Room is Unavailable for those dates!"
            end
			
		
	end
    
    def home
    	
     @user = User.where(id: current_user.id).first
     @booking = @user.bookings.paginate(page: params[:page])
    

     #@feed_items = @booking.feed.paginate(page: params[:page])
    
    end

     
    def feed
      Booking.all
    #debugger
    end

	def destroy
    	@booking.destroy
    	flash[:success] = "Booking Cancelled!"
    	redirect_to request.referrer || root_url
    end

	def new
		#@booking = Booking.new
		
		@booking = Listing.find(params[:listing_id]).bookings.new
		
		@no_of_guests=[1,2,3,4,5,6,7,8,9,10]
	end

	private
      
      def booking_params
      	params.require(:booking).permit(:check_in, :check_out,:no_of_guests, :listing_id)
      end

      def correct_user
      	@booking = current_user.bookings.find_by(id: params[:id])
      	redirect_to root_url if @booking.nil?
      end

      def is_available?
      	
      	@b = Booking.where("check_in <= ?", booking_params[:check_in]).where("check_out >= ?", booking_params[:check_in]).or(Booking.where("check_in <= ?", booking_params[:check_out]).where("check_out >= ?", booking_params[:check_out])).or(Booking.where("? <= check_in", booking_params[:check_in]).where("? >= check_out", booking_params[:check_in])).where(listing_id: booking_params[:listing_id]).count
      	
      end


end
