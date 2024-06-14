class CrudNotificationMailer < ApplicationMailer

  
  def create(object) #(In case of passing passing variable)
  # def create  (In Case of passing params)
    @object =  object
    mail to: "adityamaheshwari146@gmail.com", subject: " A new Patient appointment"
  end
end
