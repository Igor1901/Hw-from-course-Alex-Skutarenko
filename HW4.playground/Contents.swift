import Foundation


/*
 1. Создать пять строковых констант
 Одни константы это только цифры, другие содержат еще и буквы
 Найти сумму всех этих констант приведя их к Int
 (Используйте и optional binding и forced unwrapping)
 */
print("\n1")

let (const1, const2, const3, const4, const5) = ("12", "13h", "hello", "14", "55")

var sumOfConstant = 0

if let intConst1 = Int(const1) {
    sumOfConstant += intConst1
    print("const1: converted to int")
} else {
    print("const1: nil")
}

if let intConst2 = Int(const2) {
    sumOfConstant += intConst2
    print("const2: converted to int")
} else {
    print("const2: nil")
}

if let intConst3 = Int(const3) {
    sumOfConstant += intConst3
    print("const3: converted to int")
} else {
    print("const3: nil")
}

if let intConst4 = Int(const4) {
    sumOfConstant += intConst4
    print("const4: converted to int")
} else {
    print("const4: nil")
}

if Int(const5) != nil {
    sumOfConstant += Int(const5)!
    print("const4: converted to int")
} else {
    print("const5: nil")
}

print("Sum of constant: \(sumOfConstant)")

/*
 2. С сервера к нам приходит тюпл с тремя параметрами:
 statusCode, message, errorMessage (число, строка и строка)
 в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
 если statusCode от 200 до 300 исключительно, то выводите message,
 в противном случает выводите errorMessage
 После этого проделайте тоже самое только без участия statusCode
 */
print("\n2")

let response: (statusCode: Int, message: String?, errorMessage: String?) = (300, "Response", nil)
if response.statusCode >= 200 && response.statusCode <= 300 {
    if let message = response.message {
        print("Success. Message:", message)
    } else {
        print("Success. No Message:")
        
    }
} else {
    if let message = response.errorMessage {
        print("Error. Message:", message)
    } else {
        print("Error. No Message:")
    }
}


if let message = response.message {
    print("Success. Message:", message)
} else if let errorMessage = response.errorMessage {
    print("Error. Message:", errorMessage)
} else {
    print("Error. No Message:")
}

/*
 3. Создайте 5 тюплов с тремя параметрами:
 имя, номер машины, оценка за контрольную
 при создании этих тюплов не должно быть никаких данных
 после создания каждому студенту установите имя
 некоторым установите номер машины
 некоторым установите результат контрольной
 выведите в консоль:

 - имена студента
 - есть ли у него машина
 - если да, то какой номер
 - был ли на контрольной
 - если да, то какая оценка */

print("\n3")

var student1: (name: String?, carNumber: String?, mark: Double?)
var student2: (name: String?, carNumber: String?, mark: Double?)
var student3: (name: String?, carNumber: String?, mark: Double?)
var student4: (name: String?, carNumber: String?, mark: Double?)
var student5: (name: String?, carNumber: String?, mark: Double?)

student1.name = "Vasya"
student2.name = "Vladimir"
student3.name = "Igor"
student4.name = "Nikolay"
student5.name = "Alex"

student1.carNumber = "4273GFK"
student1.mark = 5.5
student2.mark = 5.8
student5.carNumber = "E"

let arrayStudent = [student1, student2, student3, student4, student5]
for student: (name: String?, carNumber: String?, mark: Double?) in arrayStudent {
    let (name, carNumber, mark) = student
    if let realName = name {
        print("Name:", realName, terminator: " ")
    }
    if let realNumber = carNumber {
        print("Car:", realNumber, terminator: " ")
    }
    if let realmark = mark {
        print("Mark:", realmark, terminator: " ")
    }
    print("")

}
