class Employee < ApplicationRecord

  # concern for validation
  include Validatable

	belongs_to :manager, class_name: "Employee", optional: true
	has_many :sub_ordinate, class_name: "Employee", foreign_key: "manager_id"

	has_one :profile
	delegate :bio, to: :profile
end
