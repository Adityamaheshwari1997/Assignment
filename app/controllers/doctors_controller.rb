class DoctorsController < ApplicationController

	#concern is using 
	include Authentication
	extend Geek

  def index
  	puts self.class.geeks
    @doctor = User.find_by(id: @current_user)
  end
end
