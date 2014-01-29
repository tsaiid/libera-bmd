class Float
  def round_with_zero(ndigits=nil)
    sprintf "%.#{ndigits.to_i}f", self
  end
end