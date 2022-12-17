import Foundation

/*
 1. Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)

 Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.

 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.

 3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
 */

enum FileType {
    case visible
    case hidden
}

struct FileDescription {
    static var maxFileSize = 3_000_000_000
    
    var path: String{
        return pathFolder + fileName
    }
    var fileSize: Int {
        didSet{
            if fileSize > FileDescription.maxFileSize {
                fileSize = oldValue
            }
        }
    }
    
    var fileName: String
    var pathFolder: String
    var typeFile: FileType
    var contentFile: String
}

var fileDescription = FileDescription(fileSize: 10000, fileName: "Index.html", pathFolder: "/Users/igorpackin/Downloads/", typeFile: .visible, contentFile: "Content")

print(fileDescription.path)


enum ColorScheme: Int {
    static var numberColor = 3
    static var firstColor = ColorScheme.red
    static var lastColor = ColorScheme.blue
    case red = 0xFF0000
    case green = 0x00FF00
    case blue = 0x0000FF
}

class Human {
    static let minAge = 0
    static let maxAge = 100
    static let minName = 1
    static let maxName = 50
    static let minWeight = 1.0
    static let maxWeight = 250.0
    static let minHeight = 30.0
    static let maxHeight = 250.0
    
    static var count = 0
    
    var firstName: String {
        didSet {
            if firstName.count < Human.minName || firstName.count > Human.maxName {
                firstName = oldValue
            }
        }
    }
    var lastName: String {
        didSet {
            if lastName.count < Human.minName || lastName.count > Human.maxName {
                lastName = oldValue
            }
        }
    }
    var age: Int {
        didSet {
            if age < Human.minAge || age > Human.maxAge {
                age = oldValue
            }
        }
    }
    var height: Double {
        didSet {
            if height < Human.minHeight || height > Human.maxHeight {
                height = oldValue
            }
        }
    }
    var weight: Double {
        didSet {
            if weight < Human.minWeight || weight > Human.maxWeight{
                weight = oldValue
            }
        }
    }
    
    init(firstName: String, lastName: String, age: Int, height: Double, weight: Double){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        Human.count += 1
    }
    var description:String {
        return "Human:" + firstName + " " + lastName + ". Age: \(age). Height: \(height). Weight: \(weight)"
    }
}

var man = Human(firstName: "Alex", lastName: "T", age: 30, height: 165, weight: 65)
var man1 = Human(firstName: "Alex1", lastName: "T1", age: 20, height: 170, weight: 50)
man.firstName = ""
man.lastName = "Ivanov"
man.lastName = " ;asldkjf;lksadjf;lkasfjkl;sadjf;lkasdj;lfjlsk;dajf;lsdakjf;llkasdjfl;klksd;afjl;skadflsadlkf"
man.height = 200
man.height = 270
man.weight = 0

print(man.description)
print(man1.description)

print("Human count: \(Human.count)")
