object Game extends Censor {
  def strLengthSum(list: List[String]): Int = {
    return list.foldLeft(0)((accum, elem) => accum + elem.length)
  }

  def main(args: Array[String]): Unit = {
    //    1
    val list = List("12", "345", "6", "7", "89")
    println("sum is " + strLengthSum(list))

    //    2
    val phrase = "darn, I forgot to shoot a text to let them know I'll be late."
    println("Before: " + phrase)
    val res = replace(phrase)
    println("After: " + res)

  }
}

trait Censor {
  val map: Map[String, String] = Map.apply("shoot" -> "pucky", "darn" -> "beans")

  def replace(src: String): String = {
    var res = src
    for ((k, v) <- map) {
      res = res.replace(k, v)
    }

    res
  }
}