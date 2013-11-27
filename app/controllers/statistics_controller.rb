class StatisticsController < ApplicationController
  def index
    @studies = ScanAnalysis.pcu_acc_list

    # 計算各部位平均的 BMD
    studies = ScanAnalysis.pcu_list
    @spine_tot_bmd = @spine_l1_bmd = @spine_l2_bmd = @spine_l3_bmd = @spine_l4_bmd = 0
    @hip_neck_bmd = @hip_troch_bmd = @hip_inter_bmd = @hip_total_bmd = @hip_wards_bmd = 0
    @forearm_ru13_bmd = @forearm_rumid_bmd = @forearm_ruud_bmd = @forearm_rutot_bmd = 0
    @spine_tot_count = @spine_l1_count = @spine_l2_count = @spine_l3_count = @spine_l4_count = 0
    @hip_count = 0
    @forearm_count = 0
    studies.each do |s|
      case s.type
      when 'S'
        @spine_tot_bmd += s.exam.tot_bmd
        @spine_tot_count += 1
        if s.exam.l1_included? then
          @spine_l1_bmd += s.exam.l1_bmd
          @spine_l1_count += 1
        end
        if s.exam.l2_included? then
          @spine_l2_bmd += s.exam.l2_bmd
          @spine_l2_count += 1
        end
        if s.exam.l3_included? then
          @spine_l3_bmd += s.exam.l3_bmd
          @spine_l3_count += 1
        end
        if s.exam.l4_included? then
          @spine_l4_bmd += s.exam.l4_bmd
          @spine_l4_count += 1
        end
      when 'H'
        @hip_neck_bmd += s.exam.neck_bmd
        @hip_troch_bmd += s.exam.troch_bmd
        @hip_inter_bmd += s.exam.inter_bmd
        @hip_total_bmd += s.exam.total_bmd
        @hip_wards_bmd += s.exam.wards_bmd
        @hip_count += 1
      when 'R'
        @forearm_ru13_bmd += s.exam.ru13_bmd
        @forearm_rumid_bmd += s.exam.rumid_bmd
        @forearm_ruud_bmd += s.exam.ruud_bmd
        @forearm_rutot_bmd += s.exam.rutot_bmd
        @forearm_count += 1
      end
    end
    @spine_avg_tot_bmd = @spine_tot_bmd / @spine_tot_count
    @spine_avg_l1_bmd = @spine_l1_bmd / @spine_l1_count
    @spine_avg_l2_bmd = @spine_l2_bmd / @spine_l2_count
    @spine_avg_l3_bmd = @spine_l3_bmd / @spine_l3_count
    @spine_avg_l4_bmd = @spine_l4_bmd / @spine_l4_count
    @hip_avg_neck_bmd = @hip_neck_bmd / @hip_count
    @hip_avg_troch_bmd = @hip_troch_bmd / @hip_count
    @hip_avg_inter_bmd = @hip_inter_bmd / @hip_count
    @hip_avg_total_bmd = @hip_total_bmd / @hip_count
    @hip_avg_wards_bmd = @hip_wards_bmd / @hip_count
    @forearm_avg_ru13_bmd = @forearm_ru13_bmd / @forearm_count
    @forearm_avg_rumid_bmd = @forearm_rumid_bmd / @forearm_count
    @forearm_avg_ruud_bmd = @forearm_ruud_bmd / @forearm_count
    @forearm_avg_rutot_bmd = @forearm_rutot_bmd / @forearm_count

    # 計算標準差，採用樣本標準差，自由度為 n-1
    @spine_tot_std = @spine_l1_std = @spine_l2_std = @spine_l3_std = @spine_l4_std = 0
    @hip_neck_std = @hip_troch_std = @hip_inter_std = @hip_total_std = @hip_wards_std = 0
    @forearm_ru13_std = @forearm_rumid_std = @forearm_ruud_std = @forearm_rutot_std = 0
    ## 歸零供下回使用
    @spine_tot_bmd = @spine_l1_bmd = @spine_l2_bmd = @spine_l3_bmd = @spine_l4_bmd = 0
    @hip_neck_bmd = @hip_troch_bmd = @hip_inter_bmd = @hip_total_bmd = @hip_wards_bmd = 0
    @forearm_ru13_bmd = @forearm_rumid_bmd = @forearm_ruud_bmd = @forearm_rutot_bmd = 0
    studies.each do |s|
      case s.type
      when 'S'
        @spine_tot_bmd += (s.exam.tot_bmd - @spine_avg_tot_bmd)**2
        @spine_l1_bmd += (s.exam.l1_bmd - @spine_avg_l1_bmd)**2 if s.exam.l1_included?
        @spine_l2_bmd += (s.exam.l2_bmd - @spine_avg_l2_bmd)**2 if s.exam.l2_included?
        @spine_l3_bmd += (s.exam.l3_bmd - @spine_avg_l3_bmd)**2 if s.exam.l3_included?
        @spine_l4_bmd += (s.exam.l4_bmd - @spine_avg_l4_bmd)**2 if s.exam.l4_included?
      when 'H'
        @hip_neck_bmd += (s.exam.neck_bmd - @hip_avg_neck_bmd)**2
        @hip_troch_bmd += (s.exam.troch_bmd - @hip_avg_troch_bmd)**2
        @hip_inter_bmd += (s.exam.inter_bmd - @hip_avg_inter_bmd)**2
        @hip_total_bmd += (s.exam.total_bmd - @hip_avg_total_bmd)**2
        @hip_wards_bmd += (s.exam.wards_bmd - @hip_avg_wards_bmd)**2
      when 'R'
        @forearm_ru13_bmd += (s.exam.ru13_bmd - @forearm_avg_ru13_bmd)**2
        @forearm_rumid_bmd += (s.exam.rumid_bmd - @forearm_avg_rumid_bmd)**2
        @forearm_ruud_bmd += (s.exam.ruud_bmd - @forearm_avg_ruud_bmd)**2
        @forearm_rutot_bmd += (s.exam.rutot_bmd - @forearm_avg_rutot_bmd)**2
      end
    end
    @spine_tot_std = @spine_tot_bmd / (@spine_tot_count - 1)
    @spine_l1_std = @spine_l1_bmd / (@spine_l1_count - 1)
    @spine_l2_std = @spine_l2_bmd / (@spine_l2_count - 1)
    @spine_l3_std = @spine_l3_bmd / (@spine_l3_count - 1)
    @spine_l4_std = @spine_l4_bmd / (@spine_l4_count - 1)
    @hip_neck_std = @hip_neck_bmd / (@hip_count - 1)
    @hip_troch_std = @hip_troch_bmd / (@hip_count - 1)
    @hip_inter_std = @hip_inter_bmd / (@hip_count - 1)
    @hip_total_std = @hip_total_bmd / (@hip_count - 1)
    @hip_wards_std = @hip_wards_bmd / (@hip_count - 1)
    @forearm_ru13_std = @forearm_ru13_bmd / (@forearm_count - 1)
    @forearm_rumid_std = @forearm_rumid_bmd / (@forearm_count - 1)
    @forearm_ruud_std = @forearm_ruud_bmd / (@forearm_count - 1)
    @forearm_rutot_std = @forearm_rutot_bmd / (@forearm_count - 1)

    # 用小數點後四位 output
    @spine_avg_tot_bmd = @spine_avg_tot_bmd.round(4)
    @spine_avg_l1_bmd = @spine_avg_l1_bmd.round(4)
    @spine_avg_l2_bmd = @spine_avg_l2_bmd.round(4)
    @spine_avg_l3_bmd = @spine_avg_l3_bmd.round(4)
    @spine_avg_l4_bmd = @spine_avg_l4_bmd.round(4)
    @hip_avg_neck_bmd = @hip_avg_neck_bmd.round(4)
    @hip_avg_troch_bmd = @hip_avg_troch_bmd.round(4)
    @hip_avg_inter_bmd = @hip_avg_inter_bmd.round(4)
    @hip_avg_total_bmd = @hip_avg_total_bmd.round(4)
    @hip_avg_wards_bmd = @hip_avg_wards_bmd.round(4)
    @forearm_avg_ru13_bmd = @forearm_avg_ru13_bmd.round(4)
    @forearm_avg_rumid_bmd = @forearm_avg_rumid_bmd.round(4)
    @forearm_avg_ruud_bmd = @forearm_avg_ruud_bmd.round(4)
    @forearm_avg_rutot_bmd = @forearm_avg_rutot_bmd.round(4)
    @spine_tot_std = @spine_tot_std.round(4)
    @spine_l1_std = @spine_l1_std.round(4)
    @spine_l2_std = @spine_l2_std.round(4)
    @spine_l3_std = @spine_l3_std.round(4)
    @spine_l4_std = @spine_l4_std.round(4)
    @hip_neck_std = @hip_neck_std.round(4)
    @hip_troch_std = @hip_troch_std.round(4)
    @hip_inter_std = @hip_inter_std.round(4)
    @hip_total_std = @hip_total_std.round(4)
    @hip_wards_std = @hip_wards_std.round(4)
    @forearm_ru13_std = @forearm_ru13_std.round(4)
    @forearm_rumid_std = @forearm_rumid_std.round(4)
    @forearm_ruud_std = @forearm_ruud_std.round(4)
    @forearm_rutot_std = @forearm_rutot_std.round(4)
  end
end
