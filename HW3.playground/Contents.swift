import Foundation

/*
 1. Создать тюпл с тремя параметрами:

 - максимальное количество отжиманий
 - максимальное количество подтягиваний
 - максимальное количество приседаний

 Заполните его своими достижениями :)

 Распечатайте его через println()
 */
print("1.")

var mySportsAchievements = (pushUps: 35, pullUps: 10, sitUps: 40)

print("My sports achievements:\nPush ups: \(mySportsAchievements.pushUps)\nPull ups: \(mySportsAchievements.pushUps)\nSit ups: \(mySportsAchievements.sitUps)")

/*
 2. Также сделайте три отдельных вывода в консоль для каждого параметра
 При том одни значения доставайте по индексу, а другие по параметру
 */
print("\n2.")

let (_, lifting, _) = mySportsAchievements

print("PushUps: \(mySportsAchievements.pushUps)")
print("PullUps: \(lifting)")
print("Squats: \(mySportsAchievements.2)")

/*
 3. Создайте такой же тюпл для другого человека (супруги или друга)
 с такими же параметрами, но с другими значениями
 Используйте промежуточную переменную чтобы поменять соответствующие значения
 первого тюпла на значения второго
 */

print("\n3.")

let tempResult = mySportsAchievements

var brotherResult = (pushUps: 15, pullUps: 5, sitUps: 20)

mySportsAchievements = brotherResult
brotherResult = tempResult

print("My Result: \(mySportsAchievements)")
print("Brother Result: \(brotherResult)")

/*
 4. Создайте третий тюпл с теми же параметрами, но значения это разница
 между соответствующими значениями первого и второго тюплов
 Результат выведите в консоль
 */
print("\n4.")

let substractPushUps = abs(mySportsAchievements.pushUps - brotherResult.pushUps)
let substractPullUps = abs(mySportsAchievements.pullUps - brotherResult.pullUps)
let substractSitUps = abs(mySportsAchievements.sitUps - brotherResult.sitUps)

let substractResult = (pushUps: substractPushUps, pullUps: substractPullUps, sitUps: substractSitUps)

print("Substract Result: \(substractResult)")
