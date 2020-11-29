def birds(arr)
  yield(arr)
end

birds(%w(raven finch hawk eagle)) do |raven, finch, *raptors|
  p raptors
end
