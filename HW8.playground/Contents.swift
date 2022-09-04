import Foundation

/*
 1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение. Некоторым студентам повысьте оценки - они пересдали. Потом добавьте парочку студентов, так как их только что перевели к вам в группу. А потом несколько удалите, так как они от вас ушли :(

 После всех этих перетрубаций посчитайте общий бал группы и средний бал

 2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.
 В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.

 3. Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool. Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно.

 Рекомендация: постарайтесь все сделать используя вложенный цикл (объяснение в уроке).
 */


/*
 1
 */


var IKBO_13_17 = ["Igor Pachkin" : 4, "Ilya Yakovlev" : 2, "Grand father" : 5, "Edic Mailean" : 2]
print(IKBO_13_17)
IKBO_13_17.updateValue(4, forKey: "Ilya Yakovlev")
print(IKBO_13_17)
IKBO_13_17["Tany Zelenina"] = 4
print(IKBO_13_17)
IKBO_13_17.removeValue(forKey: "Edic Mailean")
print(IKBO_13_17)

var sum = 0
for value in IKBO_13_17.values{
    sum += value
}
print("Общий балл группы равен: \(sum)")
print("Срединй балл группы равен: \(Double(sum) / Double(IKBO_13_17.values.count))")


/*
 2
 */

var monthsDictionary: [String : Int] = [:]
let quantityDaysInMonthsArray = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthsNamesArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November","December"]
for (index, value) in quantityDaysInMonthsArray.enumerated(){
    monthsDictionary[monthsNamesArray[index]] = value
}
// 2.1
for (index, value) in monthsDictionary {
    print(index, value)
}

//2.2

for key in monthsDictionary.keys{
    print(key, monthsDictionary[key]!)
}

//3
var flag = false
let charString = "ABCDEFGH"
var charDictionari: [String : Bool] = [:]

for (index, value) in charString.enumerated(){
    for number in 1...8{
        let Value = String(value)
        let key = Value + String(number)
        charDictionari[key] = flag
        flag != flag
        if number % 2 == index % 2{
            flag = false
        } else {
            flag = true
        }
        
    }
}

print("Chess Dictionary: \(charDictionari)\n Count: \(charDictionari.count)")
