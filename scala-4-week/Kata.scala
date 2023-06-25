object Kata {
  def binarySearch(target: Int, nums: Array[Int]): Int = {
    return getIndex(0, nums.length - 1, target, nums)
  };

  def getIndex(start: Int, end: Int, target: Int, nums: Array[Int]): Int = {
    if (start > end) return -1

    val half = (end - start) / 2 + start
    val value = nums(half)
    if (value == target) {
      return half
    } else if (value > target) {
      return getIndex(start, half - 1, target, nums)
    } else
      return getIndex(half + 1, end, target, nums)
  }

  def main(args: Array[String]): Unit = {
    val result = binarySearch(9, Array(-1, 0, 3, 5, 9, 12))
    println("expected: 4, result: " + result)
  }
}