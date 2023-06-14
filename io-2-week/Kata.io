binarySearch := method(nums, target,
    return getIndex(0, nums size, nums, target)
)

getIndex := method(start, end, nums, target,
    if(start > end, return -1)

    half := (end - start) / 2 + start
    val := nums at(half)
    if(val == target, return half)

    if(val > target, return getIndex(start, half - 1, nums, target), return getIndex(half + 1, end, nums, target))
)

nums := list(-1, 0, 3, 5, 9, 12)
target := 9
result := binarySearch(nums, target)

"expected: 4, result: " print; result println