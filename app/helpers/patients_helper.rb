module PatientsHelper
	def dateformat(date)
		date.strftime("%B %-d, %Y")
	end
end
