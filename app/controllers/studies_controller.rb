class StudiesController < ApplicationController
  def index
    @studies = ScanAnalysis.accession_lists
  end

  def show
    @studies = ScanAnalysis.where(accession_no: params[:accession_no])
    @patient = @studies.first.patient
    @conclusion = conclusion(@studies)
    @previous = ScanAnalysis.where("accession_no != ? AND scan_date > ?", params[:accession_no], @studies.first.scan_date).order(scan_date: :desc).last
    @next = ScanAnalysis.where("accession_no != ? AND scan_date < ?", params[:accession_no], @studies.first.scan_date).order(scan_date: :desc).first
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
end
