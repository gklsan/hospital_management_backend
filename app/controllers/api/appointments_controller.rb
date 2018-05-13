module Api
  class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :update, :destroy]

    # GET /appointments
    def index
      @appointments = Appointment.order("created_at DESC").all.limit(10)

      res = @appointments.collect{|app|
        {id: app.id, doctor: app.doctor.name, patient: app.patient.name, disease: app.disease}
      }

      render json: res.to_json, location: api_appointments_path
    end

    # GET /appointments/1
    def show
      render json: @appointment
    end

    # POST /appointments
    def create
      @appointment = Appointment.new(appointment_params)

      if @appointment.save
        render json: @appointment, status: :created, location: @appointment
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /appointments/1
    def update
      if @appointment.update(appointment_params)
        render json: @appointment
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /appointments/1
    def destroy
      @appointment.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_appointment
        @appointment = Appointment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def appointment_params
        params.require(:appointment).permit(:disease, :doctor_id, :patient_id)
      end
  end
end