import Foundation
import SwiftUI

enum SpaceType: String {
    case empty = "⬜"
    case player = "👨"
    case box = "💚"
    case finish = "💝"
    case gameOver = "💘"
    case wallSymbol = "⬛"
}
enum Direction: String {
    case left, right, up, down
}

class Room {
    let width: Int
    let height: Int
    var roomArray = [[SpaceType]]()
    
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        for _ in 0..<height { //рисуем белый квадрат
            var line = [SpaceType]()
            for _ in 0..<width {
                line.append(.empty) // добавляем белые квадраты
            }
            self.roomArray.append(line) // добовляем строки белых квадратов
        }
    }
    func show() {
        let topRoom = Array(repeatElement(SpaceType.wallSymbol.rawValue, count: roomArray.count + 2))
        let topRoomJoin = topRoom.joined(separator:"")
        
        print(topRoomJoin) // вверх
        
        for line in roomArray {
            var stringLine = SpaceType.wallSymbol.rawValue
            for coordinate in line {
                stringLine += coordinate.rawValue
            }
            stringLine += SpaceType.wallSymbol.rawValue // правая стена
            print(stringLine)
        }
        print(topRoomJoin) // низ стены
    }
    
}

class Box {
    var x: Int
    var y: Int
    let xFinish: Int
    let yFinish: Int
    let room: Room
    init(x: Int, y: Int, xFinish: Int, yFinish: Int, room: Room) {
        self.x = x
        self.y = y
        self.xFinish = xFinish
        self.yFinish = yFinish
        self.room = room
        room.roomArray[y][x] = SpaceType.box // присваеваем клетке коробку
        room.roomArray[yFinish][xFinish] = SpaceType.finish // присваеваем клетке финиш
    }
    func isFinish() -> Bool{
        if x == xFinish && y == yFinish {
            room.roomArray[y][x] = .gameOver
            print("Finish")
            return true
        }
        return false
    }
    func move(direction: Direction) -> Bool{
        if isFinish(){
            print("Finish. Game over")
            return false
        }
        print("Box Move:", direction.rawValue)
        var newX = x
        var newY = y
        switch direction {
        case .up:
            if y <= 0 {
                return false
            }
            newY -= 1
        case .down:
            if y >= room.height - 1 {
                return false
            }
            newY += 1
        case .left:
            if x <= 0 {
                return false
            }
            newX -= 1
        case .right:
            if x >= room.width - 1 {
                return false
            }
            newX += 1
        }
        if newX == x || newY == y {
            room.roomArray[y][x] = SpaceType.empty
            room.roomArray[newY][newX] = SpaceType.box
            x = newX
            y = newY
        }
        isFinish()
        return true
    }
    
}

class Player{
    var x: Int
    var y: Int
    var room: Room
    var box: Box
    
    init(x: Int, y: Int, room: Room, box: Box){
        self.x = x
        self.y = y
        self.room = room
        self.box = box
        room.roomArray[y][x] = SpaceType.player
    }
    func move(direction: Direction) -> Bool {
        print("Player Move:", direction.rawValue)
        var newX = x
        var newY = y
        switch direction {
        case .up:
            if y <= 0 {
                return false
            }
            newY -= 1
        case .down:
            if y >= room.height - 1   {
                return false
            }
            newY += 1
        case .left:
            if x <= 0 {
                return false
            }
            newX -= 1
        case .right:
            if x >= room.width - 1 {
                return false
            }
            newX += 1
        }
        if room.roomArray[newY][newX] == SpaceType.empty || (room.roomArray[newY][newX] == SpaceType.box && box.move(direction: direction)) {
            room.roomArray[y][x] = SpaceType.empty
            room.roomArray[newY][newX] = SpaceType.player
            x = newX
            y = newY
            return true
        }
        if room.roomArray[newY][newX] == SpaceType.gameOver {
            print("That Finish. Game Over")
        }
        return false
    }
}

let room = Room(width: 6, height: 6)
let box = Box(x: 1, y: 1, xFinish: 4, yFinish: 5, room: room)
let player = Player(x: 0, y: 0, room: room, box: box)
room.show()

let moveArray:[Direction]
moveArray = [.right, .down, .down, .down, .down, .left, .down, .right, .right]
for direction in moveArray {
    player.move(direction: direction)
    
    if box.isFinish() {
        room.show()
        break
    }
    room.show()
}

