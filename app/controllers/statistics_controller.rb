class StatisticsController < ApplicationController
  def index
    @studies = ScanAnalysis.pcu_acc_list
    spine_studies = ScanAnalysis.pcu_list.where(ref_type: "S")
    @spine_tot_bmd = spine_studies.to_a.sum { |s| s.exam.tot_bmd } / spine_studies.length
  end
end
