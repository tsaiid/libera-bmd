class StatisticsController < ApplicationController
  def index
    @studies = ScanAnalysis.pcu_acc_list

    # 計算各部位平均的 BMD
    studies = ScanAnalysis.pcu_list
    @spine_tot_bmd = @hip_neck_bmd = @forearm_ru13_bmd = 0
    @spine_tot_count = @hip_neck_count = @forearm_ru13_count = 0
    studies.each do |s|
      case s.type
      when 'S'
        @spine_tot_bmd += s.exam.tot_bmd
        @spine_tot_count += 1
      when 'H'
        @hip_neck_bmd += s.exam.neck_bmd
        @hip_neck_count += 1
      when 'R'
        @forearm_ru13_bmd += s.exam.ru13_bmd
        @forearm_ru13_count += 1
      end
    end
    @spine_avg_tot_bmd = (@spine_tot_bmd / @spine_tot_count).round(4)
    @hip_avg_neck_bmd = (@hip_neck_bmd / @hip_neck_count).round(4)
    @forearm_avg_ru13_bmd = (@forearm_ru13_bmd / @forearm_ru13_count).round(4)
  end
end
