import Foundation

/*
 1. Самостоятельно повторить проделанное в уроке

 2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)

 3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)

 4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
 */

struct Student {
    var firstName: String {
        didSet {
            firstName = firstName.capitalized
        }
    }
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            let words = newValue.split(separator: " ")
            firstName = String(words.first ?? "Error firstName")
            lastName =  String(words.last ?? "Error lastName")
        }
    }
    let birthDate: BirthDate
    
    var age: Int? {
        if let date = birthDate.date {
            let calendar = Calendar.current
            let currentComponent = calendar.dateComponents([.year], from: date, to: Date())
            return currentComponent.year
        }
        return nil;
    }
    var studyYear: Int {
        if age != nil && age! > 6 {
            return age! - 6;
        }
        return 0
    }
}
struct BirthDate {
    let day: Int
    let month: Int
    let year: Int
    var date: Date? {
        let calendar = Calendar.current
        return calendar.date(from: DateComponents(year: year, month: month, day:day))
    }
}

var birthDate = BirthDate(day: 19, month: 1, year: 2000)
var student = Student(firstName: "Igor", lastName: "Pachkin", birthDate: BirthDate(day: 19, month: 1, year: 2000))
birthDate.year
birthDate.date

student.age
student.studyYear



struct PointSegment {
    var x: Double
    var y: Double
    var description: String {
        return "(\(x), \(y))"
    }
}

struct LineSegment {
    var a: PointSegment
    var b: PointSegment
    var middle: PointSegment {
        get {
            return PointSegment(x: (b.x + a.x) / 2, y: (b.y + a.y) / 2)
        }
        set {
            let deltaX = newValue.x - middle.x
            let deltaY = newValue.y - middle.y
            a.x += deltaX
            b.x += deltaX
            a.y += deltaY
            b.y += deltaY
            
        }
    }
    var length: Double {
        get {
            return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2))
        }
        set {
            let newX = (a.x + newValue * (b.x - a.x) / length)
            let newY = (a.y + newValue * (b.y - a.y) / length)
            b = PointSegment(x:  newX, y: newY)
        }
    }
    var description: String {
        return "Segment: A(\(a.description)B\(b.description)). Middle: \(middle.description). Length = \(length)"
    }
}
var segment = LineSegment(a: PointSegment(x: 0, y: 0), b:(PointSegment(x: 2, y: 2)))

print("Segment: \(segment.description)." )

segment.middle = PointSegment(x: 0, y: 0)
print("Segment: \(segment.description)." )

segment.length = 2
print("Segment: \(segment.description)." )
segment.length = 3
print("Segment: \(segment.description)." )
