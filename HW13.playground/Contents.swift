import Foundation

/*
 1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
 */

struct Student{
    var name = "Ivan"
    var surname = "Ivanov"
    var yearOfBirth = 0000
    var averageMark = 0.0
}

var journal: [Student] = []

var student1 = Student(name: "Igor", surname: "Pachkin", yearOfBirth: 2000, averageMark: 4.4)

journal.append(student1)

var student2 = Student()

student2.averageMark = 5.0
student2.yearOfBirth = 1999
student2.surname = "Dmitriev"
student2.name = "Dima"

journal.append(student2)

var student3 = Student(name: "Petya", surname: "Petrov", yearOfBirth: 1980, averageMark: 4.7)
journal.append(student3)
var student4 = Student(name: "Oleg", surname: "Petrov", yearOfBirth: 1990, averageMark: 3.6)
journal.append(student4)
journal
/*
 2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
 */

func studentFunc(student: [Student]){
    for (index, n) in student.enumerated(){
        print(index + 1, n.name, n.surname, n.yearOfBirth, n.averageMark)
    }
}

studentFunc(student: journal)

/*
 3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
 */

let sortArray1 = journal.sorted { $0.averageMark > $1.averageMark }

print("\n")

studentFunc(student: sortArray1)

/*
 4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
 */

let sortArray2 = journal.sorted {
    let surname1 = $0.surname
    let surname2 = $1.surname
    if surname1 == surname2{
        return $0.name < $1.name
    } else {
        return $0.surname < $1.surname
    }
}
print("\n")
studentFunc(student: sortArray2)

/*
 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
 */

var journal2 = journal

journal2[0].name = "IGOR"
journal2[0].surname = "Сonqueror"
journal2[0].averageMark = 999
print("\n")
studentFunc(student: journal2)
print("\n")
studentFunc(student: journal)


/*
 6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
 */
//6.1
class StudentClass {
    var name = "Ivan"
    var surname = "Ivanov"
    var yearOfBirth = 0000
    var averageMark = 0.0
    init(name: String, surname: String, yearOfBirth: Int, averageMark: Double){
        self.name = name
        self.surname = surname
        self.yearOfBirth = yearOfBirth
        self.averageMark = averageMark
    }
}


var stClass1 = StudentClass(name: "Igor", surname: "Pachkin", yearOfBirth: 2000, averageMark: 4.4)
var stClass2 = StudentClass(name: "Petya", surname: "Petrov", yearOfBirth: 1980, averageMark: 4.7)
var stClass3 = StudentClass(name: "Dima", surname: "Dmitriev", yearOfBirth: 1999, averageMark: 5.0)
var stClass4 = StudentClass(name: "Oleg", surname: "Petrov", yearOfBirth: 1990, averageMark: 3.6)

var journalClass: [StudentClass] = [stClass1, stClass2, stClass3, stClass4]

//6.2

func printClass(array: [StudentClass]){
    for (index, i) in array.enumerated(){
        print("\(index + 1). \(i.surname) \(i.name) \(i.yearOfBirth) \(i.averageMark) ")
    }
}

//6.3

let sortJournalClass1 = journalClass.sorted {$0.averageMark > $1.averageMark}
print("\n")
printClass(array: sortJournalClass1)

//6.4
let sortJournalClass2 = journalClass.sorted {
    let surname1 = $0.surname
    let surname2 = $1.surname
    if surname1 == surname2{
        return $0.name < $1.name
    } else {
        return $0.surname < $1.surname
    }
}
print("\n")
printClass(array: sortJournalClass2)

//6.5

var journalClass2 = journalClass

journalClass2[0].name = "IGOR"
journalClass2[0].surname = "Сonqueror"
journalClass2[0].averageMark = 999
print("\n")
printClass(array: journalClass2)
print("\n")
printClass(array: journalClass)
print("Одинаковы так как классы работают через ссылки")
