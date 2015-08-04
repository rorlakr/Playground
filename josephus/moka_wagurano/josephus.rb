def josephus( n, k )
  arr = (1..n).to_a

  (n-1).times { puts arr.rotate!(k).pop }
  arr[0]
end