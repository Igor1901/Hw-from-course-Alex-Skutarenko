import Foundation

/*
 1. создать массив "дни в месяцах"
 12 элементов содержащих количество дней в соответствующем месяце

 используя цикл for и этот массив

1 - выведите количество дней в каждом месяце (без имен месяцев)
2 - используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
3 - сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
4 - сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
5 - для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
*/
print("1.1\n")
// 1.1
let dayInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthInYear = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November","December"]

for (index, value) in dayInMonth.enumerated() {
    print("Month \(index + 1) - \(value)")
}

// 1.2
// первоначально я хотел использовать счетчик, который прибавлял бы += 1 каждую итерацию,
// но вспомнил о enumerated() и переписал задания 1.2 и 1.1 заодно

print("\n1.2\n")
for (index, value) in dayInMonth.enumerated() {
    print("\(monthInYear[index]) - \(value)")
}

//1.3


var tuplesArray = [(month: String, days: Int)]();

for (index, value) in dayInMonth.enumerated(){
    tuplesArray.append((monthInYear[index], value))
}

for tuple in tuplesArray{
    print(tuple)
}

//1.4

for value in dayInMonth.reversed() {
    print("\(value)")
}

//1.5
let month = "June"
var day = 18
print("\nHow many days have passed since: \(day) \(month)")
var countMonth = 0

//находим индекс месяца
for (index, value) in monthInYear.enumerated(){
    if value == month{
        countMonth += index
        break
    } else if value != month{
        continue
    }
}

//проходимся до нужного месяца не включая
for (index, value) in dayInMonth.enumerated(){
    if index < countMonth{
        day += value
    }
}
print("Days have passed", day)

/*
 2. Сделайте первое задание к уроку номер 4 используя массивы:

  (создайте массив опшинал интов и посчитайте сумму)

1 - в одном случае используйте optional binding
2 - в другом forced unwrapping
3 - а в третьем оператор ??
 */

//2.1 optional binding

let arrayFromHW4 = ["12", "13h", "hello", "14", "55"]
var sumOfConstant = 0

for array1 in arrayFromHW4{
    if let array1 = Int(array1){
        sumOfConstant += array1
        print("\(array1): converted to int")
    } else{
        print("\(array1): nil")
    }
}
print("sum of constant will be: \(sumOfConstant)")

//2.2 forced unwrapping

var sumOfConstant2 = 0
for array2 in arrayFromHW4{
    if Int(array2) != nil{
        sumOfConstant2 += Int(array2)!
        print("\(array2): converted to int")
    } else{
        print("\(array2): nil")
    }
}
print("sum of constant will be: \(sumOfConstant2)")

//2.3
var sumOfConstant3 = 0
for array3 in arrayFromHW4 {
    sumOfConstant3 += Int(array3) ?? 0
}
print("sum of constant will be: \(sumOfConstant3)")

/*
 3. создайте строку алфавит и пустой массив строк

 в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый
 встроку и добавляйте в массив, причем так, чтобы на выходе получился массив с
 алфавитом задом-наперед
 */

let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var reversedAlphabetArray = [String]()

for alph in alphabet.reversed(){
    let Alph = String(alph)
    reversedAlphabetArray.append(Alph)
}
print("Strings reversed alphabet: ", reversedAlphabetArray)
