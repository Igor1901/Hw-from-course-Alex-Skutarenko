import Foundation

/*
 1 Выведите в консоль минимальные и максимальные значения базовых типов, не ленитесь :)
 */
print("\n1.")
print("For 'Int' type. MIN value \(Int.min), MAX value: \(Int.max).")
print("For 'Int32' type. MIN value \(Int32.min), MAX value: \(Int32.max).")
print("For 'Int32' type. MIN value \(Int32.min), MAX value: \(Int32.max).")
print("For 'Int16' type. MIN value \(Int16.min), MAX value: \(Int16.max).")
print("For 'Int8' type. MIN value \(Int8.min), MAX value: \(Int8.max).\n")

print("For 'UInt' type. MIN value \(UInt.min), MAX value: \(UInt.max).")
print("For 'UInt32' type. MIN value \(UInt32.min), MAX value: \(UInt32.max).")
print("For 'UInt16' type. MIN value \(UInt16.min), MAX value: \(UInt16.max).")
print("For 'UInt8' type. MIN value \(UInt8.min), MAX value: \(UInt8.max).")

/*
 2. Создайте 3 константы с типами Int, Float и Double
 Создайте другие 3 константы, тех же типов: Int, Float и Double,
 при чем каждая из них это сумма первых трех, но со своим типом
 */

let intConstant = 12
let floatConstant: Float = 12.1
let doubleConstant = 6.3

let secondIntConstant = intConstant + Int(floatConstant) + Int(doubleConstant)
let secondFloatConstant: Float = Float(intConstant) + floatConstant + Float(doubleConstant)
let secondDoubleConstant = Double(intConstant) + Double(floatConstant) + doubleConstant

print("\n2.")
print("Int Const: \(intConstant), Float Const: \(floatConstant), Double Const: \(doubleConstant)")

print("Int Sum: \(secondIntConstant), Float Sum: \(secondFloatConstant), Double Sum: \(secondDoubleConstant) \n")

/*
 3. Сравните Int результат суммы с Double и выведите отчет в консоль
 */
print("\n3.")
if Double(secondIntConstant) > secondDoubleConstant{
    print("Int Sum > Double Sum")
} else if Double(secondIntConstant) == secondDoubleConstant{
    print("Int Sum == Double Sum")
} else {
    print("Int Sum < Double Sum")
}
