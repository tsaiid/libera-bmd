class Float
  def round_for_report(ndigits=nil)
    output = sprintf "%.#{ndigits.to_i}f", self
    # correct -0.0 to 0.0
    self.round(ndigits) == 0 && output[0] == "-" ? output[1..-1] : output
  end
end