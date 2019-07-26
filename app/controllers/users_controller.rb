class UsersController < ApplicationController

  def show
    
  	@user = User.find(params[:id])
    @listings = @user.listings.paginate(page: params[:page])
  end

  def showbooking 
    
    @user = User.find(params[:id])
    @bookings = @user.bookings.paginate(page: params[:page])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
  	else
  		render 'new'
  	end
  end

  def new
  	@user = User.new
  end

  private

    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
