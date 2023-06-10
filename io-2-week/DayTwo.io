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



