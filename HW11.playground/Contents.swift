import Foundation

/*
 1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.
 */

func clouserFunc(closures: () -> Void ) -> Void{
    print("Start")
    for i in 1...10{
        print(i)
    }
    closures()
}

clouserFunc {print("closures\n")}

/*
 2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.
 */
let intArray = [51, 44, 8, 4504, 50, 1, 81, 1001, 277]
let bigFirst = intArray.sorted {$0 > $1}
let shortFirst = intArray.sorted {$0 < $1}

print("Изначальный массив: \(intArray)")
print("От большего к меньшему: \(bigFirst)")
print("От меньшего к большему: \(shortFirst)\n")


/*
 3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.
 */



func testFunc3(array: [Int], closure: (Int, Int?) -> Bool ) -> Int? {
    var optional: Int?
    for number in array {
        optional =  closure(number, optional) ? number : optional
        /*  расшифровка
        if closure(number, optional) == true {
            optional = number
        } else {
            continue
        }
        */
    }
    return optional
}

let resultMax = testFunc3(array: intArray) {$1 == nil ? true : $0 > $1!}

/*  расшифровка
 let resultMax = testFunc3(array: intArray) {
     if $1 == nil {
         return true
     } else {
         return $0 > $1!
     }
 }
 */

let resultMin = testFunc3(array: intArray) {$1 == nil ? true : $0 < $1!}

print("Start Array: ", intArray, ". Max:",resultMax ?? "No max value", ". Min:", resultMin ?? "No min value")

/*
 4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы
 */

print("\nN 4\n")

let text = "a Adsfkj;lewjqoir324234kl;jasdF;ffkjF ;mnvzxc,n<MNLK Jal;dsfQEWRaFSLJ:342;l,.mmn,sdfa"
let vowelsSet = Set(["a", "e", "i", "o", "u", "y"])
let consonantsSet = Set(["b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
                  "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]);
let digitsSet = Set(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]);
func priorityCharacter(character: Character) -> Int{
    let lowerLetter = String(character).lowercased()
    switch lowerLetter {
    case let letter where vowelsSet.contains(letter):
        return 4
    case let letter where consonantsSet.contains(letter):
        return 3
    case let letter where digitsSet.contains(letter):
        return 2
    case " ":
        return 1
    default:
        return 0
    }
}
let arraySort = text.sorted {
    let letter1LowerCased = String($0).lowercased()
    let letter2LowerCased = String($1).lowercased()
    let priority1 = priorityCharacter(character: $0)
    let priority2 = priorityCharacter(character: $1)
    if priority1 == priority2 {
        return letter1LowerCased == letter2LowerCased ? $0 < $1 : letter1LowerCased < letter2LowerCased
    } else {
        return priority1 > priority2
    }
}
print(String(arraySort))

