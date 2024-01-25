module TZInfo
  module Amagi
    include TimezoneDefinition
    d = Date.current
    # d = Date.parse(ENV["AMAGI_DST_DATE"]) if ENV["AMAGI_DST_DATE"]
    # switch_over_epoch = Rails.configuration.respond_to?(:amagi_dst_switch_time) ? Time.find_zone("UTC").parse(d.strftime("%Y-%m-%d") + Rails.configuration.amagi_dst_switch_time ).to_i : Time.find_zone("UTC").parse(d.strftime("%Y-%m-%d") + " 08:30:00").to_i
    # adst_offset = Rails.configuration.respond_to?(:amagi_dst_switch_offset) ? Rails.configuration.amagi_dst_switch_offset : 23400
    switch_over_epoch = 120000
    adst_offset =
    timezone 'Amagi' do |tz|
      tz.offset :o0, 19800, 0, :AST
      tz.offset :o1, adst_offset, 0, :ADST

      tz.transition d.year, d.month, :o1, switch_over_epoch

    end
  end
end

