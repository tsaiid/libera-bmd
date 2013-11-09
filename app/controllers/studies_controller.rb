class StudiesController < ApplicationController
  def index
    @studies = ScanAnalysis.accession_lists
  end

  def show
  end
end
