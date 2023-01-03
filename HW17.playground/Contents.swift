import Foundation

/*
 Крестики нолики (Средний уровень)

 1. Создать тип, представляющий собой поле для игры в крестики нолики
 На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
 Добавьте возможность красиво распечатывать поле

 2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
 причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.

 3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.

 4. Если хотите, добавте алгоритм, который вычислит победителя
 */

enum SpaceType: String {
    case empty = "⬜"
    case o = "⭕"
    case x = "❌"
}
class Zone{
    let size: Int
    var array = [[SpaceType]]()
    init(size: Int){
        self.size = size
    }
    func create(){
        print("Create new Tic Tac Toe")
        for _ in 0..<size {
            let line = Array(repeating: SpaceType.empty, count: size)
            array.append(line)
        }
    }
    func show(){
        for line in array{
            var stringLine = ""
            for character in line{
                stringLine += character.rawValue
            }
            print(stringLine)
        }
    }
    subscript (x: Int, y: Int) -> SpaceType {
        get {
            if x < 0 || y < 0 || x >= size || y >= size {
                return .empty
            }
            return array[y][x]
        }
        set {
            print("\(newValue.rawValue) - (\(x), \(y))")
            if !(x < 0 || y < 0 || x >= size || y >= size || newValue == .empty || array[y][x] != .empty) {
                array[y][x] = newValue
            }
        }
    }
}
let zone = Zone(size: 3)
zone.create()
zone.show()
zone[1,1] = .x
zone.show()
zone[0,2] = .o
zone.show()
zone[1,0] = .x
zone.show()
zone[0,0] = .o
zone.show()
zone[1,2] = .x
zone.show()

