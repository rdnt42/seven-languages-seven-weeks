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
    writeField()
    writeX(1, 1)
    writeO(0, 2)
    writeX(0, 1)
    writeO(2, 1)
  }
}