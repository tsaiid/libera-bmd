class StatisticsController < ApplicationController
  def pcu_spine
    @sex = "male"
    @interval = 5
    @age_lists = (4..17).map { |i| i * @interval }
  end

  def pcu_average
    @studies = ScanAnalysis.pcu_acc_list

    # 計算各部位平均的 BMD
    ## Spine
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

    ## Hip
    @hip_count = Hip.pcu.select("count(*) as count").first.count

    tmp_bmd = Hip.pcu.select("sum(neck_bmd) as bmd").first.bmd
    @hip_avg_neck_bmd = tmp_bmd / @hip_count
    @hip_neck_std = Math.sqrt(Hip.pcu.select("sum((neck_bmd - #{@hip_avg_neck_bmd})*(neck_bmd - #{@hip_avg_neck_bmd})) as delta_sum").first.delta_sum / (@hip_count - 1))

    tmp_bmd = Hip.pcu.select("sum(troch_bmd) as bmd").first.bmd
    @hip_avg_troch_bmd = tmp_bmd / @hip_count
    @hip_troch_std = Math.sqrt(Hip.pcu.select("sum((troch_bmd - #{@hip_avg_troch_bmd})*(troch_bmd - #{@hip_avg_troch_bmd})) as delta_sum").first.delta_sum / (@hip_count - 1))

    tmp_bmd = Hip.pcu.select("sum(inter_bmd) as bmd").first.bmd
    @hip_avg_inter_bmd = tmp_bmd / @hip_count
    @hip_inter_std = Math.sqrt(Hip.pcu.select("sum((inter_bmd - #{@hip_avg_inter_bmd})*(inter_bmd - #{@hip_avg_inter_bmd})) as delta_sum").first.delta_sum / (@hip_count - 1))

    tmp_bmd = Hip.pcu.select("sum(htot_bmd) as bmd").first.bmd
    @hip_avg_htot_bmd = tmp_bmd / @hip_count
    @hip_htot_std = Math.sqrt(Hip.pcu.select("sum((htot_bmd - #{@hip_avg_htot_bmd})*(htot_bmd - #{@hip_avg_htot_bmd})) as delta_sum").first.delta_sum / (@hip_count - 1))

    tmp_bmd = Hip.pcu.select("sum(wards_bmd) as bmd").first.bmd
    @hip_avg_wards_bmd = tmp_bmd / @hip_count
    @hip_wards_std = Math.sqrt(Hip.pcu.select("sum((wards_bmd - #{@hip_avg_wards_bmd})*(wards_bmd - #{@hip_avg_wards_bmd})) as delta_sum").first.delta_sum / (@hip_count - 1))

    ## Forearm
    @forearm_count = Forearm.pcu.select("count(*) as count").first.count

    tmp_bmd = Forearm.pcu.select("sum(ru13tot_bmd) as bmd").first.bmd
    @forearm_avg_ru13_bmd = tmp_bmd / @forearm_count
    @forearm_ru13_std = Math.sqrt(Forearm.pcu.select("sum((ru13tot_bmd - #{@forearm_avg_ru13_bmd})*(ru13tot_bmd - #{@forearm_avg_ru13_bmd})) as delta_sum").first.delta_sum / (@forearm_count - 1))

    tmp_bmd = Forearm.pcu.select("sum(rumidtot_bmd) as bmd").first.bmd
    @forearm_avg_rumid_bmd = tmp_bmd / @forearm_count
    @forearm_rumid_std = Math.sqrt(Forearm.pcu.select("sum((rumidtot_bmd - #{@forearm_avg_rumid_bmd})*(rumidtot_bmd - #{@forearm_avg_rumid_bmd})) as delta_sum").first.delta_sum / (@forearm_count - 1))

    tmp_bmd = Forearm.pcu.select("sum(ruudtot_bmd) as bmd").first.bmd
    @forearm_avg_ruud_bmd = tmp_bmd / @forearm_count
    @forearm_ruud_std = Math.sqrt(Forearm.pcu.select("sum((ruudtot_bmd - #{@forearm_avg_ruud_bmd})*(ruudtot_bmd - #{@forearm_avg_ruud_bmd})) as delta_sum").first.delta_sum / (@forearm_count - 1))

    tmp_bmd = Forearm.pcu.select("sum(rutot_bmd) as bmd").first.bmd
    @forearm_avg_rutot_bmd = tmp_bmd / @forearm_count
    @forearm_rutot_std = Math.sqrt(Forearm.pcu.select("sum((rutot_bmd - #{@forearm_avg_rutot_bmd})*(rutot_bmd - #{@forearm_avg_rutot_bmd})) as delta_sum").first.delta_sum / (@forearm_count - 1))

    # 用小數點後四位 output
    @spine_avg_tot_bmd = @spine_avg_tot_bmd.round(4)
    @spine_avg_l1_bmd = @spine_avg_l1_bmd.round(4)
    @spine_avg_l2_bmd = @spine_avg_l2_bmd.round(4)
    @spine_avg_l3_bmd = @spine_avg_l3_bmd.round(4)
    @spine_avg_l4_bmd = @spine_avg_l4_bmd.round(4)
    @hip_avg_neck_bmd = @hip_avg_neck_bmd.round(4)
    @hip_avg_troch_bmd = @hip_avg_troch_bmd.round(4)
    @hip_avg_inter_bmd = @hip_avg_inter_bmd.round(4)
    @hip_avg_htot_bmd = @hip_avg_htot_bmd.round(4)
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
    @hip_htot_std = @hip_htot_std.round(4)
    @hip_wards_std = @hip_wards_std.round(4)
    @forearm_ru13_std = @forearm_ru13_std.round(4)
    @forearm_rumid_std = @forearm_rumid_std.round(4)
    @forearm_ruud_std = @forearm_ruud_std.round(4)
    @forearm_rutot_std = @forearm_rutot_std.round(4)
  end

  def spine
    sex = params[:sex]
    age = params[:age].to_i
    interval = params[:interval].to_i
    age_up = age + (interval.even? ? interval / 2 : interval / 2  + 1)
    age_low = age - interval / 2
    level = params[:level]
    select_age_sql = "(strftime('%Y', scan_analyses.scan_date) - strftime('%Y', patients.birthdate)) - (strftime('%m-%d', scan_analyses.scan_date) < strftime('%m-%d', patients.birthdate)) as age"
    age_range_sql = "age >= #{age_low} AND age < #{age_up}"
    bmd_count_sql = "sum(l#{level}_bmd) as bmd, sum(l#{level}_included) as count"
    sex_sql = { "male" => "M", "female" => "F" }

    s = Spine.pcu.
              joins(:patient).
              select(select_age_sql).
              where('sex = ?', sex_sql[sex]).
              where(age_range_sql).
              select(bmd_count_sql).
              map { |s| { "bmd" => s.bmd, "count" => s.count } }.
              first
    avg_bmd = (s["bmd"] / s["count"])
    s["avg_bmd"] = avg_bmd
    variance_sql = "sum((l#{level}_bmd - #{avg_bmd}) * (l#{level}_bmd - #{avg_bmd})) as delta_sum"
    s["std"] = Math.sqrt(Spine.pcu.
                              joins(:patient).
                              select(select_age_sql).
                              where('sex = ?', sex_sql[sex]).
                              where(age_range_sql).
                              select(variance_sql).
                              first.
                              delta_sum / (s["count"] - 1))

    if !params[:round_num].nil? then
      s.each do |k, v|
        s[k] = v.round(params[:round_num].to_i)
      end
    end

    respond_to do |format|
      format.html { render json: s }
      format.json { render json: s }
    end
  end

  private
  def calculate_spine(sex, age)
    select_age_sql = "(strftime('%Y', scan_analyses.scan_date) - strftime('%Y', patients.birthdate)) - (strftime('%m-%d', scan_analyses.scan_date) < strftime('%m-%d', patients.birthdate)) as age"
    age_range_sql = "age >= #{age - 2} AND age < #{age + 3}"
    bmd_count_sql = "sum(l1_bmd) as l1_bmd, sum(l1_included) as l1_count,
                     sum(l2_bmd) as l2_bmd, sum(l2_included) as l2_count,
                     sum(l3_bmd) as l3_bmd, sum(l3_included) as l3_count,
                     sum(l4_bmd) as l4_bmd, sum(l4_included) as l4_count"
    sex_sql = { "male" => "M", "female" => "F" }

    s = Spine.pcu.
              joins(:patient).
              select(select_age_sql).
              where('sex = ?', sex_sql[sex]).
              where(age_range_sql).
              select(bmd_count_sql).
              map { |s| {
                "l1_bmd" => s.l1_bmd, "l1_count" => s.l1_count,
                "l2_bmd" => s.l2_bmd, "l2_count" => s.l2_count,
                "l3_bmd" => s.l3_bmd, "l3_count" => s.l3_count,
                "l4_bmd" => s.l4_bmd, "l4_count" => s.l4_count
              } }.
              first
    (1..4).each do |i|
      instance_variable_set "@#{sex}_#{age}_l#{i}_count", s["l#{i}_count"]
      instance_variable_set "@#{sex}_#{age}_avg_l#{i}_bmd", (s["l#{i}_bmd"] / s["l#{i}_count"])
      variance_sql = "sum((l#{i}_bmd - #{instance_variable_get("@#{sex}_#{age}_avg_l#{i}_bmd")}) * (l#{i}_bmd - #{instance_variable_get("@#{sex}_#{age}_avg_l#{i}_bmd")})) as delta_sum"
      instance_variable_set "@#{sex}_#{age}_l#{i}_std", Math.sqrt(Spine.pcu.
                                                                    joins(:patient).
                                                                    select(select_age_sql).
                                                                    where('sex = ?', sex_sql[sex]).
                                                                    where(age_range_sql).
                                                                    select(variance_sql).
                                                                    first.
                                                                    delta_sum / (s["l#{i}_count"] - 1))
    end
  end

  def spine_output_round(round_num, sex, age)
    # 用小數點後四位 output
    (1..4).each do |i|
      instance_variable_set "@#{sex}_#{age}_avg_l#{i}_bmd", instance_variable_get("@#{sex}_#{age}_avg_l#{i}_bmd").round(round_num)
      instance_variable_set "@#{sex}_#{age}_l#{i}_std", instance_variable_get("@#{sex}_#{age}_l#{i}_std").round(round_num)
    end
  end
end
