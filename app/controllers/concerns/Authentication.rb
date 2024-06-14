module Authentication
 	extend ActiveSupport::Concern

 	included do 
 		before_action :authenticate_user
 	end

	private

	def authenticate_user
	  unless @current_user
	    redirect_to login_path, alert: 'Please log in'
	  end
	end
end