def compare a, b
  c = a.chars.reduce(0){ |s, x| s + x.to_i } <=> b.chars.reduce(0){ |s, x| s + x.to_i } 
  if c == 0 
    c = a <=> b
  end
  c
end

def order_weight(strng)
  weights = strng.split
  weights.sort{ |a, b| compare a, b }.join " "
end
