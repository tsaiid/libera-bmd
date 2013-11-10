class StudiesController < ApplicationController
  def index
    @studies = ScanAnalysis.accession_lists
  end

  def show
    @studies = ScanAnalysis.where(accession_no: params[:acc])
  end
end
