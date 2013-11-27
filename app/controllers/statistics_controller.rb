class StatisticsController < ApplicationController
  def index
    @studies = ScanAnalysis.pcu_acc_list
  end
end
