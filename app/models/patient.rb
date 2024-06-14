class Patient < ApplicationRecord

  # concern for validation
  include Validatable

  belongs_to :doctor, class_name: 'User', foreign_key: 'user_id'

end
