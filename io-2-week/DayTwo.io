#1
fibo := Object clone
fibo calculate := method(n, num1, num2,
    for(i, 1, n,
        prevSum := num1 + num2
        num1 = num2
        num2 = prevSum)
    return num1)

num1 := 0
num2 := 1
n := 7
result := fibo calculate(n, num1, num2)
"#1 fibo result " print; result println

fibo calculateRecursive := method(n,
    if n == 0 or n == 1 return n
    return fibo calculateRecursive(n - 1) + fibo calculateRecursive(n - 2))

recResult := fibo calculateRecursive(n)
"#1 fibo recursive result " print; result println

#2
List avg := method(list,
    sum := 0
    list foreach (v,
        sum = sum + v
    )

    return sum / list size
)
list := List clone

list append(1)
list append(2)
list append(3)
list append(4)

avg := list avg(list)
"#2 avg result " print; avg println

#3
Dim := Object clone
Dim matrix ::= nil
Dim dim := method(x, y,
    result := List clone
    for(i, 1, y,
        row := List clone
        for(j, 1, x,
            row append(0)
        )
        result append(row)
    )
    matrix = result
)
Dim get := method(x, y,
    row := matrix at(y)
    return row at(x)
)

Dim set := method(x, y, value,
    row := matrix at(y)
    row atPut(x, value)
)

Dim getFileText := method(
    sb := Sequence clone
    for(y, 0, matrix size - 1,
        row := matrix at(y)
        for(x, 0, row size - 1,
            sb appendSeq(row at(x) asString)
            if(x != (row size ) - 1, sb appendSeq(","))
        )
        sb appendSeq("\n")
    )

    return sb
)

newMatrix := Dim clone
newMatrix dim(10, 5)
"#3 get result " print; newMatrix get(2, 3) println
newMatrix set(2, 3, 14)
"#3 get result " print; newMatrix get(2, 3) println

#4

file := File with("matrix_file.txt")
file remove
file openForUpdating

matrixText := newMatrix getFileText()
file write(matrixText)
file close




