class PatientsController < ApplicationController
  def index
    @patients = Patient.lists.page(params[:page])
  end

  def show
    @patient = Patient.where(identifier1: params[:pid]).first
    patients = Patient.lists
    index = patients.index(@patient)
    @previous = (index > 0 ? patients[index - 1] : nil)
    @next = patients[index + 1]
  end

  private
  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def show_params
    #params.require(:patient).permit(:last_name)
  end

end
