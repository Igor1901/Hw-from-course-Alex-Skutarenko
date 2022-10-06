import Foundation

 /*
  1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
  */


func revolvingHearts() -> String {
    return "\u{1F49E}"
}
func cherry() -> String {
    return "\u{1F338}"
}
func sparklingHeart() -> String {
    return "\u{1F496}"
}

print(revolvingHearts() + cherry() + sparklingHeart())


/*
 2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
*/


func chess(x : String, y : Int) -> String{
    var xyz = 0
    let charString = "ABCDEFGH"
    for (index, value) in charString.enumerated(){
        let letter = String(value)
        if letter == x {
            xyz = index
        } else {
            continue
        }
    }
    if xyz % 2 == y % 2 {
        return "Черная клетка"
    } else {
        return "Белая клетка"
    }
}
print(chess(x: "B", y: 5))


/*
 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
 */


var array = [1, 2, 3, 4, 5, 6]

func reversedArray(x : [Int]) -> [Int] {
    return x.reversed()
}
func xyz(numbers : Int...) -> [Int]{
    return reversedArray(x: numbers)
}
print(xyz(numbers: 1, 2, 3, 4))


/*
 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
 */


func reversed(x : inout [Int]) {
    x = x.reversed()
}

print(reversed(x: &array))
print(array)


/*
 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)
 */


var text = "1. Swift makes 1053 it easy to create arrays in your code using an array literal: simply surround a comma-separated list of values with square brackets. Without any other information, Swift creates an array that includes the specified values, automatically inferring the array’s Element type. For example:"

func string(string: String) -> String {
    let numbers = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
    var result = ""
    for str in string{
        let notString = String(str).lowercased()
        switch notString{
        case "a", "e", "i", "o", "u":
            result += notString.uppercased()
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
                "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            result += notString.lowercased()
        case ".", ",", "-", ";", ":":
            continue
        case "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if let num = numbers[Int(notString)!]{
                result += num
            }
        default:
            result += " "
        }
    }
    return result
}

print("\(text)\n")
print(string(string: text))
