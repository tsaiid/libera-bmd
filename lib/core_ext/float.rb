class Float
  def round_for_report(ndigits=nil)
    sprintf "%.#{ndigits.to_i}f", self
  end
end