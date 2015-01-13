
# v = 
# abcdefghijklmnopqrstuvwxyz
# tffftffftf
t = true
f = false
#  a, e, i ,o ,u
#    a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z
V = [t, f, f, f, t, f, f, f, t, f, f, f, f, f, t, f, f, f, f, f, t, f, f, f, f, f]

# x = "abcdef"
# x.unpack('c*').each do |xx|
#   print xx, ","
#   print xx - 97, ","
#   puts v[xx - 97]
# end
# x.each_char do |xx| 
#   puts xx.unpack('C')
# end

def count word
  # word.length
  cnt_v = 0
  cnt_m = 0
  chars = word.unpack('c*')
  chars.each_with_index do |x, i|
    if V[x - 97]
      cnt_m += 1 unless V[chars[i + 1] - 97]
    end
    cnt_v += 1 if V[x - 97]
  end
  # cnt_v
  cnt_m
end

def stemming word 
  w = word.downcase
  if w.end_with?('sses')
    return "#{w[0...-4]}ss"
  elsif w.end_with?('ies')
    return "#{w[0...-3]}i"
  elsif w.end_with?('ss')
    return w
  elsif w.end_with?('s')
    return w[0...-1]
  elsif w.end_with?('eed')
    puts w
    puts w[0...-3]
    puts count(w[0...-3])
    if count(w[0...-3]) > 0
      return w[0...-1]
    else
      return w
    end 
  end
end