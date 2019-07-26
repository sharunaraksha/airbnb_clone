class StaticPagesController < ApplicationController
  def home
     
     @listing  = listings.build 
     if params[:search] == "all"
    	@feed_items = @listing.feed.paginate(page: params[:page])
     elsif params[:search] == "1"
        #@feed_items = @listing.feed.where(price_per_guest: params[:search]).paginate(page: params[:page])
         @feed_items = @listing.feed.where("price_per_guest <= 1000").order( :price_per_guest ).paginate(page: params[:page])
     elsif params[:search] == "2"
     	 @feed_items = @listing.feed.where("price_per_guest > 1000 AND price_per_guest <= 2000 ").paginate(page: params[:page])
     elsif
     	@feed_items = @listing.feed.where("price_per_guest > 2000").paginate(page: params[:page])
     end
      
  end

  def help
  end

  def about
  end
end
