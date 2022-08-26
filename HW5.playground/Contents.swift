import Foundation


/*
 1. Посчитать количество секунд от начала года до вашего дня рождения.
 Игнорируйте високосный год и переходы на летнее и зимнее время.
 Но если хотите - не игнорируйте :)
 */
print("\n1")

//19 january

let numberDay = 19
let numberSecond = numberDay * 24 * 60 * 60

print("Number Second to 19.01: \(numberSecond)")

/*
 2. Посчитайте в каком квартале вы родились
 */
print("\n2")

let montheNumber = 1
var numberOfKvartal = montheNumber / 3

if montheNumber % 3 > 0 {
    numberOfKvartal += 1
} else {
    numberOfKvartal += 0
}

print("Number quarter 19.01: \(numberOfKvartal)")

/*
3. No infix and postfix operators ++ -- in new  Swift version
*/

/*
4. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h
*/
print("\n4")

let cell = (x: 5, y: 5)
print(cell)
if cell.x % 2 == cell.y % 2 {
    print("black")
} else {
    print("white")
}
