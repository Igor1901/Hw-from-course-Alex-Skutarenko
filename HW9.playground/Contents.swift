import Foundation


/*
 1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.
 */
let text = "Elizabeth was the daughter of Henry 8 and Anne Boleyn, his second wife, who was executed when Elizabeth was two years old. Anne's marriage to Henry was annulled, and Elizabeth was declared illegitimate. Her half-brother Edward VI ruled until his death in 1553, bequeathing the crown to Lady Jane Grey and ignoring the claims of his two half-sisters, the Catholic Mary and the younger Elizabeth, in spite of statute law to the contrary. Edward's will was set aside and Mary became queen, deposing Lady Jane Grey. During Mary's reign, Elizabeth was imprisoned for nearly a year on suspicion of supporting Protestant rebels."
var vowels = 0
var consonants = 0
var numbers = 0
var oterSimbols = 0

for i in text{
    let lowerSymbol = String(i).lowercased()
    switch lowerSymbol{
    case "a", "e", "i", "o", "u":
        vowels += 1
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        consonants += 1
    case "1", "2", "3", "4", "5", "6", "7", "8", "9":
        numbers += 1
    default:
        oterSimbols += 1
    }
}
print("Vowels: \(vowels), Consonants: \(consonants), Numbers: \(numbers), Other simbols: \(oterSimbols), All text: \(text.count)")


/*
 2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа
 */

let age = 22

switch age {
case 0...12:
    print("Ребенок")
case 13...16:
    print("Подросток")
case 17...22:
    print("Студент")
case 22...29:
    print("Молодой человек")
case 30...39:
    print("Все еще норм")
case 40...49:
    print("Батя")
case 50...59:
    print("Батя через 10 лет")
case 60...69:
    print("Олд")
default:
    print("Столько не живут!")
}


/*
 3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.
 */

let (firstName, secondName, fatherName) = ("Игорь", "Пачкин", "Владимирович")

switch (firstName, secondName, fatherName){
case (firstName, _, _) where firstName.first == "А" || firstName.first == "О":
    print("\(firstName)")
case (_, _, fatherName) where fatherName.first == "В" || fatherName.first == "Д":
    print("\(firstName) \(fatherName)")
case (_, secondName, _) where secondName.first == "Е" || secondName.first == "З":
    print("\(secondName)")
default:
    print("\(firstName) \(secondName) \(fatherName)")
}

/*
 4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.
 */

/*
 4
 */
print("\nN 4\n")

var shipsArray = [
//   A  B  C  D  E  F  G  H  I  J
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], // 1
    [0, 1, 0, 3, 3, 3, 0, 0, 2, 0], // 2
    [0, 0, 0, 0, 0, 0, 0, 0, 2, 0], // 3
    [0, 0, 0, 0, 0, 0, 4, 0, 0, 0], // 4
    [0, 0, 0, 0, 2, 0, 4, 0, 0, 0], // 5
    [0, 0, 0, 0, 2, 0, 4, 0, 0, 0], // 6
    [0, 0, 0, 0, 0, 0, 4, 0, 3, 0], // 7
    [0, 0, 0, 0, 0, 0, 0, 0, 3, 0], // 8
    [0, 1, 0, 0, 0, 0, 0, 0, 3, 0], // 9
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  // 10
];
print("Start Ship Pozition:")
print(" A  B  C  D  E  F  G  H  I  J")
print("--------------------------------")
for (n, array) in shipsArray.enumerated() {
    print("\(array) | \(n+1)")
}
print("")

let maxX = 9
let maxY = 9
let lettersDictionary =  ["A": 0, "B": 1, "C": 2, "D": 3, "E" : 4, "F": 5, "G": 6, "H": 7, "I": 8, "J": 9]

let shotsArray = ["A1", "B2", "D2",  "E2", "F2", "I1", "I2", "I3", "G6", "G7"]

for shot in shotsArray {
    var tempShot = shot
    let letter = String(tempShot.remove(at: shot.startIndex))
    var x:Int = lettersDictionary[letter] ?? 0
    var y:Int = Int(shot) ?? 1
    y = y - 1
    y = y <= maxY || y >= 0 ? y : 0
    x = x <= maxX || x >= 0 ? x : 0
    
    let result: String
    switch (x, y) {
    
    case (let x, let y) where shipsArray[y][x] == 1:
        result = "Kill"
        shipsArray[y][x] = -1
    
    case (let x, let y) where shipsArray[y][x] > 1:
        result = "Hurt"
        shipsArray[y][x] = -1
        oX: for i in (0..<x).reversed() {
            if shipsArray[y][i] == 0 {
                break oX;
            } else if shipsArray[y][i] != -1  {
                shipsArray[y][i] -= 1;
            }
        }
        x9: for i in (x + 1)...maxX {
            if shipsArray[y][i] == 0 {
                break x9;
            } else if shipsArray[y][i] != -1 {
                shipsArray[y][i] -= 1;
            }
        }
        oY: for i in (0..<y).reversed() {
            if shipsArray[i][x] == 0 {
                break oY;
            } else if shipsArray[i][x] != -1 {
                shipsArray[i][x] -= 1;
            }
        }
        y9: for i in (y + 1)...maxY {
            if shipsArray[i][x] == 0 {
                break y9;
             } else if shipsArray[i][x] != -1 {
                shipsArray[i][x] -= 1;
            }
        }
    default:
        result = "Fail"
    }
    print("Shot: \(shot). Result: \(result)")
}
print("\nFinish Ship Pozition:")
print(" A  B  C  D  E  F  G  H  I  J")
print("--------------------------------")
for (n, array) in shipsArray.enumerated() {
    print("\(array) | \(n+1)")
}
