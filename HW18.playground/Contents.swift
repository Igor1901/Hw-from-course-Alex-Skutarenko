import Foundation

/*
 1. Создайте базовый класс артист с "именем", "фамилией" и методом "выступление". У каждого дочернего класса свой метод "выступление" (актер - играет, клоун - развлекает, танцор - танцует), включающее в себя представление участника, в каком жанре выступление и действие (можно просто вывод строки). Создайте дочерний класс "художник", который не хочет, чтобы его называли вы и всегда ставит другое имя, когда вы пытаетесь его назвать. Положить все экземпляры в один массив и пройдясь по нему вызвать у всех выступление.

 */

class Artist {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    func performance() -> String{
        return "\(firstName)\(lastName) Show: "
    }
}

class Actor: Artist{
    override func performance() -> String {
        return super.performance() + "plays"
    }
}

class Clown: Artist{
    override func performance() -> String {
        return super.performance() + "entertains"
    }
}

class Dancer: Artist{
    override func performance() -> String {
        return super.performance() + "dancing"
    }
}

class Painter: Artist{
    override var firstName: String {
        get{
            return String(super.firstName.reversed())
        }
        set{
            super.firstName = newValue
        }
    }
    override func performance() -> String {
        return super.performance() + "drawing picture"
    }
}

let array: [Artist] = [
Actor(firstName: "Ac", lastName: "tor"),
Clown(firstName: "Clo", lastName: "wn"),
Dancer(firstName: "Dan", lastName: "cer"),
Painter(firstName: "Pain", lastName: "ter")
]

for i in array{
    print(i.performance())
}


/*
 2. Базовый класс - "транспортное средство"; свойства - скорость, вместимость, стоимость одной перевозки (все computed properties). Несколько дочерних классов (самолет, корабль, вертолет, машина, поезд) с переопределенными свойствами (для каждого своя скорость вместимость и стоимость). Создать по одному объекту каждому дочернему классу. У всех есть метод, который что-то расчитывает (скорость, расстояние, количество пассажиров), конкретно сколько уйдет денег и времени, чтобы перевести определенное количество человек из пункта А в пункт В. При перевозке 100 и 1000 человек ответить на следующие вопросы:
 -Как быстро мы сможем это сделать и каким транспортом?
 -Стоимость всех перевозок и количество?
 -Какой транспорт быстрее справится и какой более выгодный?

 */

class Transport {
    var name: String {
        return ""
    }
    var speed: Double {
        return 0
    }
    var capacity: Int {
        return 0
    }
    var price: Double {
        return 0
    }
    func calculatePriceAndTimeAndCountTrips(distance: Double, passengers: Int) -> (Double, Double, Int) {
        if speed <= 0 || capacity <= 0 || price <= 0 {
            return (0, 0, 0)
        }
        let oneTripTime = distance / speed
        let countTrip = ceil (Double(passengers) / Double(capacity))
        return (price * distance * countTrip, oneTripTime * countTrip, Int(countTrip))
    }
}

class Car: Transport {
    override var name: String {
        return "Car"
    }
    override var speed: Double {
        return 90
    }
    override var capacity: Int {
        return 5
    }
    override var price: Double {
        return 10
    }
}

class Fly: Transport {
    override var name: String {
        return "Fly"
    }
    override var speed: Double {
        return 800
    }
    override var capacity: Int {
        return 500
    }
    override var price: Double {
        return 250
    }
}

class Ship: Transport {
    override var name: String {
        return "Ship"
    }
    override var speed: Double {
        return 40
    }
    override var capacity: Int {
        return 500
    }
    override var price: Double {
        return 50
    }
}

let arrayTransport: [Transport] = [Car(), Fly(), Ship()]
func showTransport(distance: Double, passengers: Int) {
    print("\n")
    print("Show Transport for Distance: \(distance) and Passengers: \(passengers)")
    var minPriceTransport = arrayTransport.first!
    var (minPrice, minTime, _) = minPriceTransport.calculatePriceAndTimeAndCountTrips(distance: distance, passengers: passengers)
    var minTimeTransport = arrayTransport.first!
    
    for transport in arrayTransport {
        let (price, time, count) = transport.calculatePriceAndTimeAndCountTrips(distance: distance, passengers: passengers)
        print("Transport type: \(transport.name). Distance: \(distance). Passengers: \(passengers). Price: \(price). Time: \(time). Count Trips: \(count)")
        if minTime > time {
            minTimeTransport = transport
            minTime = time
        }
        if minPrice > price {
            minPriceTransport = transport
            minPrice = price
        }
    }
    print("Minimum Price Transport: \(minPriceTransport.name). Price: \(minPrice)\n Minimum Time Transpoert: \(minTimeTransport.name). Time: \(minTime)")
    
}
showTransport(distance: 1000, passengers: 100)
showTransport(distance: 1000, passengers: 1000)
