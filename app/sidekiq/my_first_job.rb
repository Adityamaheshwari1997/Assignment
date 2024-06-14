class MyFirstJob
  include Sidekiq::Job

  def perform(patient_id)
  	  patient = Patient.find(patient_id)
  	 CrudNotificationMailer.create(patient).deliver_now
  end
end
