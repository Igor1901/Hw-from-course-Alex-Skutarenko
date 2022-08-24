import Foundation

/*
 1. Выполните задание 1 урока о базовых операторах:
 только вместо forced unwrapping и optional binding используйте оператор ??

 Когда посчитаете сумму, то представьте свое выражение в виде строки
 Например: 5 + nil + 2 + 3 + nil = 10

 но в первом случае используйте интерполяцию строк, а во втором конкатенацию
 */
print("1\n")

let arrayOfString = ["n12", "55", "666", "j7b", "19"]
var sum = 0
var stringSum = ""

for array in arrayOfString {
    let intArray = Int(array)
    sum += intArray ?? 0
    if !stringSum.isEmpty{
        stringSum += " + "
    }
    if let notNilArray = intArray {
        stringSum += String(notNilArray)
    } else {
        stringSum += "nil"
    }
}
print("\(stringSum) = \(sum)")

/*
 2. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов,
 можно использовать составные символы. Посчитайте длину строки методом SWIFT
 */

print("\n2\n")

let stringUnicode = "\u{1F436} \u{1F496} \u{1F425} \u{1F431} \u{1F428}"

print(stringUnicode)
print("Length Swift : \(stringUnicode.count).")

/*
 3. Создайте строку английский алфавит, все буквы малые от a до z

 задайте константу - один из символов этого алфавита

 Используя цикл for определите под каким индексов в строке находится этот символ
 */
print("\n3\n")

let letter : Character = "y"
let alphabet = "abcdefghijklmnopqrstuvwxyz"
var index = 0
 
for number in alphabet{
    index += 1
    if number == letter{
      print("The letter number \(number) in the alphabet is \(index)")
    } 
if index == alphabet.count{
    print("Character \"\(letter)\" not found in Alphabet: \"\(alphabet)\"")
}
}
