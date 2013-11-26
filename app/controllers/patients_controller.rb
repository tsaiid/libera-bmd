class PatientsController < ApplicationController
  def index
    @patients = Patient.not_phantom
  end

  def show
    @patient = Patient.where(identifier1: params[:pid]).first
  end

  private
  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def show_params
    #params.require(:patient).permit(:last_name)
  end

end
