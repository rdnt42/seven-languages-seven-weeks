def binary_search(nums = [], target)
  get_index(0, nums.length - 1, nums, target)
end

def get_index(start_index, end_index, nums = [], target)
  if start_index > end_index
    -1
  end

  half = (end_index - start_index) / 2 + start_index
  val = nums[half]
  if val == target
    half
  elsif val > target
    get_index(start_index, half - 1, nums, target)
  else
    get_index(half + 1, end_index, nums, target)
  end
end

nums = [-1, 0, 3, 5, 9, 12]
target = 9
result = binary_search(nums, target)

puts "expected: 4, result: #{result}"