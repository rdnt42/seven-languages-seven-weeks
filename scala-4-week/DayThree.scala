object Game {
  def startGame() = {
    val rand = new scala.util.Random
    val rndValue = rand.between(1, 10)

    println("choose number between 1 and 10")
    var input = scala.io.StdIn.readLine().toInt
    while(input != rndValue) {
      if(input < rndValue) {
        println("Your number lower than answer")
      } else {
        println("Your number greater than answer")
      }
      input = scala.io.StdIn.readLine().toInt
    }
    println("You won!")
  }

  def main(args: Array[String]): Unit = {
    startGame()
  }
}