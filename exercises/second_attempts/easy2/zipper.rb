def zip(array1, array2)
  end_index = array1.size
  (0...end_index).map { |index| [array1[index], array2[index]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
