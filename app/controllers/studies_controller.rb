class StudiesController < ApplicationController
  def index
    @studies = ScanAnalysis.accession_lists.
                            select("scan_date,
                                    accession_no,
                                    patients.last_name AS pt_name,
                                    patients.identifier1 AS pt_pid").
                            page(params[:page])
  end

  def show
    @studies = ScanAnalysis.where("ref_type IS NOT NULL").where(accession_no: params[:accession_no])
    @patient = @studies.first.patient
    @conclusion = conclusion(@studies)
  end

  def report
    @studies = ScanAnalysis.where("ref_type IS NOT NULL").where(accession_no: params[:accession_no])
    mode = params[:mode] || 'html'
    output = { report: get_reports(@studies, mode) }

    set_cors_headers
    respond_to do |format|
      format.html { render json: output }
      format.json { render json: output }
    end
  end

  def pagination
    study = ScanAnalysis.where(accession_no: params[:accession_no]).first
    prv_s = study.nil? ?
               nil :
               ScanAnalysis.accession_lists.
                            where("accession_no IS NOT ?", params[:accession_no]).
                            where("scan_date > ?", study.scan_date).
                            select(:accession_no).
                            last
    prv_link = study_show_path(prv_s.accession_no) unless prv_s.nil?
    nxt_s = study.nil? ?
            nil :
            ScanAnalysis.accession_lists.
                         where("accession_no IS NOT ?", params[:accession_no]).
                         where("scan_date < ?", study.scan_date).
                         select(:accession_no).
                         first
    nxt_link = study_show_path(nxt_s.accession_no) unless nxt_s.nil?

    respond_to do |format|
      format.html { render json: {previous: prv_s, next: nxt_s, prev_link: prv_link, next_link: nxt_link} }
      format.json { render json: {previous: prv_s, next: nxt_s, prev_link: prv_link, next_link: nxt_link} }
    end
  end

  private
  def conclusion(studies)
    scores = []
    studies.each do |study|
      scores << study.score.to_f
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
      "The BMD meeting the criteria is " + (scores.min < -2 ? "below" : "within") + " the expected range of age, according to 2007 ISCD (the International Society for Clinical Densitometry) combined official positions.\n\n(Z-score of -2.0 or lower is defined as 'below the expected range for age', and a Z-score above -2.0 is 'within the expected range for age')"
    end
  end

  def get_reports(studies, mode = 'html')
    reports = ""
    if (studies.length > 0)
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
        reports += "Conclusions:\n#{conclusion(studies)}"
      end
    else
      reports = nil
    end
  end

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end
end
