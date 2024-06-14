# Preview all emails at http://localhost:3000/rails/mailers/crud_notification_mailer
class CrudNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/create
  def create
    CrudNotificationMailer.create
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/update
  def update
    CrudNotificationMailer.update
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/delete
  def delete
    CrudNotificationMailer.delete
  end

end
