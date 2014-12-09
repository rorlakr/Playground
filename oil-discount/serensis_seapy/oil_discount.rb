# 조희영(serensis) & 정창훈(seapy)

def oil_calc(galon)
  first_galon = galon - 20
  if first_galon <= 0
    return galon * 0.90
  elsif first_galon > 0
    price = 20 * 0.90
    second_galon = first_galon - 20
    if second_galon <= 0
      price = price + (first_galon * 0.80)
    elsif second_galon > 0
      price = price + (20 * 0.80)
      price = price + (second_galon * 0.75)
    end
    return price
  end
end

def oil_calc3(galon)
  galons = []
  size = galon / 20
  mod = galon % 20

  if size >= 3
    galons = [20, 20, galon - 40]
  elsif size = 2 || (size = 2 && mod > 0)
    galons = [20, galon - 20]
  else size = 1
    galons = [20]
  end

  total = 0
  prices = [0.90, 0.80, 0.75]
  galons.each do |g|
    total += g * prices.shift
  end
  total
end

p "#{oil_calc(35)}, #{oil_calc3(35)}"
p "#{oil_calc(40)}, #{oil_calc3(40)}"
p "#{oil_calc(61)}, #{oil_calc3(61)}"
p "#{oil_calc(100)}, #{oil_calc3(100)}"