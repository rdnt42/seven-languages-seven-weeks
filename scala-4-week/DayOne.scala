object Game {
  var field = Array.fill(3, 3)(" ")

  def writeField(): Unit = {
    println("---------------")
    for (i <- 0 to 2) {
      for (j <- 0 to 2) {
        print('|');
        print(field(i)(j));
      }
      print('|');
      println("")
    }
  }

  def writeX(x: Int, y: Int) = {
    field(2 - y)(x) = "x"
    writeField();
  };

  def writeO(x: Int, y: Int) = {
    field(2 - y)(x) = "o"
    writeField();
  }

  def main(args: Array[String]): Unit = {
    for (i <- 1 to 9) {
      writeField()
      val strArr = scala.io.StdIn.readLine().split(",")
      if( i % 2 == 0) {
        writeX(strArr(0).toInt, strArr(1).toInt)
      } else {
        writeO(strArr(0).toInt, strArr(1).toInt)
      }
    }
  }
}