def rect_into_squares(lng, wdth, nil_if_same = true)
  return nil if lng == wdth && nil_if_same
  return [] if lng == 0 || wdth == 0

  min, max = [lng, wdth].minmax
  [min] + rect_into_squares(min, max - min, false)
end
