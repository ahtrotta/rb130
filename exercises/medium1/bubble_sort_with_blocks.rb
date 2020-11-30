#def bubble_sort!(arr)
#  loop do
#    switched = false
#
#    (0...(arr.size - 1)).each do |i|
#      cmpr = block_given? ? yield(arr[i], arr[i + 1]) : arr[i] < arr[i + 1]
#
#      unless cmpr
#        arr[i], arr[i + 1] = arr[i + 1], arr[i]
#        switched = true
#      end
#    end
#    
#    break unless switched
#  end
#  nil
#end
#
#array = [5, 3]
#bubble_sort!(array)
#p array == [3, 5]
#
#array = [5, 3, 7]
#bubble_sort!(array) { |first, second| first >= second }
#p array == [7, 5, 3]
#
#array = [6, 2, 7, 1, 4]
#bubble_sort!(array)
#p array == [1, 2, 4, 6, 7]
#
#array = [6, 12, 27, 22, 14]
#bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
#p array == [14, 22, 12, 6, 27]
#
#array = %w(sue Pete alice Tyler rachel Kim bonnie)
#bubble_sort!(array)
#p array == %w(Kim Pete Tyler alice bonnie rachel sue)
#
#array = %w(sue Pete alice Tyler rachel Kim bonnie)
#bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
#p array == %w(alice bonnie Kim Pete rachel sue Tyler)


# FURTHER EXPLORATION

def bubble_sort!(arr)
  loop do
    switched = false

    (0...(arr.size - 1)).each do |i|
      el1, el2 = nil, nil

      if block_given?
        el1, el2 = yield(arr[i]), yield(arr[i + 1])
      else
        el1, el2 = arr[i], arr[i + 1]
      end

      unless el1 < el2
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        switched = true
      end
    end
    
    break unless switched
  end
  nil
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
