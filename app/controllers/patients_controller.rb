class PatientsController < ApplicationController
  def index
    @patients = Patient.lists.page(params[:page])
  end

  def show
    @patient = Patient.where(identifier1: params[:pid]).first
  end

  def key
    @patient = Patient.find(params[:patient_key])
  end

  def pagination
    p = Patient.where(identifier1: params[:pid]).first
    prv_p = p.nil? ?
              nil :
              Patient.lists.
                      where("identifier1 < ?", p.pid).
                      last
    prv_link = patient_show_path(prv_p.pid)
    nxt_p = p.nil? ?
              nil :
              Patient.lists.
                      where("identifier1 > ?", p.pid).
                      first
    nxt_link = patient_show_path(nxt_p.pid)

    respond_to do |format|
      format.html { render json: {previous: prv_p, next: nxt_p, prev_link: prv_link, next_link: nxt_link} }
      format.json { render json: {previous: prv_p, next: nxt_p, prev_link: prv_link, next_link: nxt_link} }
    end
  end

  def pagination_key
    p = Patient.find(params[:patient_key])
    prv_p = p.nil? ?
              nil :
              Patient.where("patient_key < ?", p.patient_key).last
    prv_link = patient_key_path(prv_p.patient_key)
    nxt_p = p.nil? ?
              nil :
              Patient.where("patient_key > ?", p.patient_key).first
    nxt_link = patient_key_path(nxt_p.patient_key)

    respond_to do |format|
      format.html { render json: {previous: prv_p, next: nxt_p, prev_link: prv_link, next_link: nxt_link} }
      format.json { render json: {previous: prv_p, next: nxt_p, prev_link: prv_link, next_link: nxt_link} }
    end
  end

  private
  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def show_params
    #params.require(:patient).permit(:last_name)
  end

end
