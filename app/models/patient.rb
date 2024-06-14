class Patient < ApplicationRecord

  # concern for validation
  include Validatable

  belongs_to :doctor, class_name: 'User', foreign_key: 'user_id'

  # Symbol-style Callbacks
  before_create -> { puts "Congratulations!" }

	# block-style callback
  after_initialize do |patient|
    puts "You have initialized an object!"
  end

  #scope
  scope :older_than_20, -> { where("age > ?", 20) }

  #class method
  def self.older_than_20
  	 where("age > ?", 20)
  end
end
