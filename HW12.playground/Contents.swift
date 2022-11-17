import Foundation

/*
 1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
 */
enum ChessColor: String {
    case  white = "White", black = "Black"
}
enum ChessLetter: String {
    case a = "A", b = "B", c = "C", d = "D", e = "E", f = "F", g = "G", h = "H"
}

enum ChessDigit: Int {
 case one = 1 , two, three, four, five, six, seven, eight
}

enum ChessType: String {
    case rook = "Rook", knight = "Knight", bishop = "Bishop", pawn = "Pawn", king = "King", queen = "Queen"
    
}
typealias ChessFigure = (ChessType, ChessColor, ChessLetter, ChessDigit)


var whiteKing: ChessFigure = (ChessType.king, ChessColor.white, ChessLetter.b, ChessDigit.one)
var whiteRook1: ChessFigure = (ChessType.rook, ChessColor.white, ChessLetter.d, ChessDigit.seven)
var whiteRook2: ChessFigure = (ChessType.rook, ChessColor.white, ChessLetter.e, ChessDigit.eight)
var blackKing: ChessFigure = (ChessType.king, ChessColor.black, ChessLetter.f, ChessDigit.eight)

let figureArray = [whiteKing, whiteRook1, whiteRook2, blackKing]

/*
 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
 */

func xyz(_ array: [ChessFigure]){
    for f in array{
        print(f.0.rawValue, f.1.rawValue, f.2.rawValue, f.3.rawValue)
    }
}
xyz(figureArray)

