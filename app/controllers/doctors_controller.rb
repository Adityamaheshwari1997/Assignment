class DoctorsController < ApplicationController

	#concern is using 
	include Authentication

  def index
  	puts self.class.geeks
    @doctor = User.find_by(id: @current_user)
  end
end
