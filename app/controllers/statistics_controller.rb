class StatisticsController < ApplicationController
  def index
    @studies = ScanAnalysis.pcu_list
  end
end
