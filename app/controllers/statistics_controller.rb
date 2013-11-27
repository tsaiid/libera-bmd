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
    @spine_avg_tot_bmd = @spine_tot_bmd / @spine_tot_count
    @hip_avg_neck_bmd = @hip_neck_bmd / @hip_neck_count
    @forearm_avg_ru13_bmd = @forearm_ru13_bmd / @forearm_ru13_count

    # 計算標準差，採用樣本標準差，自由度為 n-1
    @spine_tot_std = @hip_neck_std = @forearm_ru13_std = 0
    @spine_tot_bmd = @hip_neck_bmd = @forearm_ru13_bmd = 0
    studies.each do |s|
      case s.type
      when 'S'
        @spine_tot_bmd += (s.exam.tot_bmd - @spine_avg_tot_bmd)**2
      when 'H'
        @hip_neck_bmd += (s.exam.neck_bmd - @hip_avg_neck_bmd)**2
      when 'R'
        @forearm_ru13_bmd += (s.exam.ru13_bmd - @forearm_avg_ru13_bmd)**2
      end
    end
    @spine_tot_std = @spine_tot_bmd / (@spine_tot_count - 1)
    @hip_neck_std = @hip_neck_bmd / (@hip_neck_count - 1)
    @forearm_ru13_std = @forearm_ru13_bmd / (@forearm_ru13_count - 1)

    # 用小數點後四位 output
    @spine_avg_tot_bmd = @spine_avg_tot_bmd.round(4)
    @hip_avg_neck_bmd = @hip_avg_neck_bmd.round(4)
    @forearm_avg_ru13_bmd = @forearm_avg_ru13_bmd.round(4)
    @spine_tot_std = @spine_tot_std.round(4)
    @hip_neck_std = @hip_neck_std.round(4)
    @forearm_ru13_std = @forearm_ru13_std.round(4)
  end
end
