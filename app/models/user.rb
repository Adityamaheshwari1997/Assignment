class User < ApplicationRecord
  has_secure_password

 	# concern for validation
	include Validatable
end
