class PatientsController < ApplicationController
  #concern is using 
  include Authentication

  def index
    if @current_user.type.eql?("Doctor")
      @user = User.find_by(id: @current_user.id)
      @patients = @user.patients

      # scope is calling
      # @patients = @user.patients.older_than_20

      # class method calling
        # @patients = Patient.older_than_20
    else
      @patients = Patient.all
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
    if @patient.valid?

      # sending email job using sidekiq
      # MyFirstJob.perform_async(@patient.id)

      # sending email normal way
      CrudNotificationMailer.create(@patient).deliver_now

      # sending email pass params to a mailer action

      # CrudNotificationMailer.with(patient: @patient).create.deliver_now


      flash[:errors] = 'Created Successfully'
      redirect_to patients_path
    else
      flash[:errors] = @patient.errors.full_messages
      render :new
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:errors] = 'Updated Successfully'
      redirect_to patient_path(@patient)
    else
      flash[:errors] = @patient.errors.full_messages
      redirect_to edit_patient_path
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    if @patient.delete
      flash[:errors] = 'Deleted Successfully'
      redirect_to root_path(@patient)
    else
      flash[:errors] = @patient.errors.full_messages
      redirect_to destroy_patient_path
    end
  end
  def graph
    @patients_by_day = Patient.group_by_day(:created_at).count
  end
  private
  def patient_params
    params.require(:patient).permit(:name, :gender, :age, :description, :user_id)
  end
end
