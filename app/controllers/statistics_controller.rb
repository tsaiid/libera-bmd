class StatisticsController < ApplicationController
  def index
    @studies = ScanAnalysis.pcu_acc_list

    # 計算各部位平均的 BMD
    tmp_bmd = Spine.pcu.select("sum(l1_bmd) as bmd").first.bmd
    @spine_l1_count = Spine.pcu.select("sum(l1_included) as count").first.count
    @spine_avg_l1_bmd = tmp_bmd / @spine_l1_count
    @spine_l1_std = Math.sqrt(Spine.pcu.select("sum((tot_bmd - #{@spine_avg_l1_bmd})*(tot_bmd - #{@spine_avg_l1_bmd})) as delta_sum").first.delta_sum / (@spine_l1_count - 1))

    tmp_bmd = Spine.pcu.select("sum(l2_bmd) as bmd").first.bmd
    @spine_l2_count = Spine.pcu.select("sum(l2_included) as count").first.count
    @spine_avg_l2_bmd = tmp_bmd / @spine_l2_count
    @spine_l2_std = Math.sqrt(Spine.pcu.select("sum((tot_bmd - #{@spine_avg_l2_bmd})*(tot_bmd - #{@spine_avg_l2_bmd})) as delta_sum").first.delta_sum / (@spine_l2_count - 1))

    tmp_bmd = Spine.pcu.select("sum(l3_bmd) as bmd").first.bmd
    @spine_l3_count = Spine.pcu.select("sum(l3_included) as count").first.count
    @spine_avg_l3_bmd = tmp_bmd / @spine_l3_count
    @spine_l3_std = Math.sqrt(Spine.pcu.select("sum((tot_bmd - #{@spine_avg_l3_bmd})*(tot_bmd - #{@spine_avg_l3_bmd})) as delta_sum").first.delta_sum / (@spine_l3_count - 1))

    tmp_bmd = Spine.pcu.select("sum(l4_bmd) as bmd").first.bmd
    @spine_l4_count = Spine.pcu.select("sum(l4_included) as count").first.count
    @spine_avg_l4_bmd = tmp_bmd / @spine_l4_count
    @spine_l4_std = Math.sqrt(Spine.pcu.select("sum((tot_bmd - #{@spine_avg_l4_bmd})*(tot_bmd - #{@spine_avg_l4_bmd})) as delta_sum").first.delta_sum / (@spine_l4_count - 1))

    tmp_bmd = Spine.pcu.select("sum(tot_bmd) as bmd").first.bmd
    @spine_tot_count = Spine.pcu.select("count(*) as count").first.count
    @spine_avg_tot_bmd = tmp_bmd / @spine_tot_count
    @spine_tot_std = Math.sqrt(Spine.pcu.select("sum((tot_bmd - #{@spine_avg_tot_bmd})*(tot_bmd - #{@spine_avg_tot_bmd})) as delta_sum").first.delta_sum / (@spine_tot_count - 1))

    # 用小數點後四位 output
    @spine_avg_tot_bmd = @spine_avg_tot_bmd.round(4)
    @spine_avg_l1_bmd = @spine_avg_l1_bmd.round(4)
    @spine_avg_l2_bmd = @spine_avg_l2_bmd.round(4)
    @spine_avg_l3_bmd = @spine_avg_l3_bmd.round(4)
    @spine_avg_l4_bmd = @spine_avg_l4_bmd.round(4)
=begin
    @hip_avg_neck_bmd = @hip_avg_neck_bmd.round(4)
    @hip_avg_troch_bmd = @hip_avg_troch_bmd.round(4)
    @hip_avg_inter_bmd = @hip_avg_inter_bmd.round(4)
    @hip_avg_total_bmd = @hip_avg_total_bmd.round(4)
    @hip_avg_wards_bmd = @hip_avg_wards_bmd.round(4)
    @forearm_avg_ru13_bmd = @forearm_avg_ru13_bmd.round(4)
    @forearm_avg_rumid_bmd = @forearm_avg_rumid_bmd.round(4)
    @forearm_avg_ruud_bmd = @forearm_avg_ruud_bmd.round(4)
    @forearm_avg_rutot_bmd = @forearm_avg_rutot_bmd.round(4)
=end

    @spine_tot_std = @spine_tot_std.round(4)
    @spine_l1_std = @spine_l1_std.round(4)
    @spine_l2_std = @spine_l2_std.round(4)
    @spine_l3_std = @spine_l3_std.round(4)
    @spine_l4_std = @spine_l4_std.round(4)

=begin
    @hip_neck_std = @hip_neck_std.round(4)
    @hip_troch_std = @hip_troch_std.round(4)
    @hip_inter_std = @hip_inter_std.round(4)
    @hip_total_std = @hip_total_std.round(4)
    @hip_wards_std = @hip_wards_std.round(4)
    @forearm_ru13_std = @forearm_ru13_std.round(4)
    @forearm_rumid_std = @forearm_rumid_std.round(4)
    @forearm_ruud_std = @forearm_ruud_std.round(4)
    @forearm_rutot_std = @forearm_rutot_std.round(4)
=end
  end
end
