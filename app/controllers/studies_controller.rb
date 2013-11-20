class StudiesController < ApplicationController
  def index
    @studies = ScanAnalysis.accession_lists
  end

  def show
    @studies = ScanAnalysis.where("ref_type IS NOT NULL").where(accession_no: params[:accession_no])
    @study_lists = ScanAnalysis.accession_lists.where(accession_no: params[:accession_no])
    @patient = @studies.first.patient
    @conclusion = conclusion(@studies)
    studies = ScanAnalysis.accession_lists
    index = studies.index(@study_lists.first)
    @previous = (index > 0 ? studies[index - 1] : nil)
    @next = studies[index + 1]
  end

  def report
    @studies = ScanAnalysis.where("ref_type IS NOT NULL").where(accession_no: params[:accession_no])
    mode = params[:mode] || 'html'
    output = { report: get_reports(@studies, mode) }
    respond_to do |format|
      format.html { render json: output }
      format.json { render json: output }
    end
  end

  private
  def conclusion(studies)
    scores = []
    studies.each do |study|
      scores << study.score
    end
    case studies.first.t_or_z
    when 't'
      if scores.min <= -2.5
        "The BMD meets the criteria of osteoporosis, according to the WHO (World Health Organization) classification."
      elsif scores.min < -1.0
        "The BMD meets the criteria of low bone mass, according to the WHO (World Health Organization) classification."
      else
        "The BMD meets the criteria of normal limit, according to the WHO (World Health Organization) classification."
      end
    when 'z'
      if scores.min < 2
        "The BMD meeting the criteria is within the expected range of age, according to 2007 ISCD (the International Society for Clinical Densitometry) combined official positions."
      else
        "The BMD meeting the criteria is below the expected range of age, according to 2007 ISCD (the International Society for Clinical Densitometry) combined official positions."
      end
    end
  end

  def get_reports(studies, mode = 'html')
    reports = ""
    case mode
    when 'html'
      studies.each do |study|
        report = "<p>#{study.exam.report_str}</p>"
        reports += report
      end
      reports += "<h4>Conclusions:</h4><p>#{conclusion(studies)}</p>"
    when 'text'
      studies.each do |study|
        report = "#{study.exam.report_str}\n\n"
        reports += report
      end
      reports += "Conclusions:\n\n#{conclusion(studies)}"
    end
  end
end
