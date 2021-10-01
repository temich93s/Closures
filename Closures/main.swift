//
//  main.swift
//  Closures
//
//  Created by 2lup on 30.09.2021.
//

import Foundation

print("Hello, World!")


//MARK: Метод sorted
print("\n//Метод sorted")

let someArray1 = ["q", "w", "e", "r", "t", "y", "u", "i"]

func someFunc1(_ a: String, _ b: String) -> Bool {
    return a > b
}

print(someArray1.sorted(by: someFunc1))


//MARK: Синтаксис замыкающего выражения
print("\n//Синтаксис замыкающего выражения")

print(someArray1.sorted(by: {(a: String, b: String) -> Bool in return a > b }))


//MARK: Определение типа из контекста
print("\n//Определение типа из контекста")

print(someArray1.sorted(by: { a, b in return a > b }))


//MARK: Неявные возвращаемые значения из замыканий с одним выражением
print("\n//Неявные возвращаемые значения из замыканий с одним выражением")

print(someArray1.sorted(by: { a, b in a > b }))


//MARK: Сокращенные имена параметров
print("\n//Сокращенные имена параметров")

print(someArray1.sorted(by: { $0 > $1 }))


//MARK: Операторные функции
print("\n//Операторные функции")

print(someArray1.sorted(by: >))


//MARK: Последующее замыкание
print("\n//Последующее замыкание")

print(someArray1.sorted(by:) { $0 > $1 })
print(someArray1.sorted { $0 > $1 })

let someArray2 = ["zero", "one"]
let someArray3 = [0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1]
print(someArray3)

let someArray4 = someArray3.map { (number) -> String in
    if 0 == number {
        return someArray2[0]
    } else {
        return someArray2[1]
    }
}

print(someArray4)

func someFunc2(someBool: Bool, chooseTrue: () -> Void, chooseFalse: () -> Void) {
    someBool ? chooseTrue() : chooseFalse()
}

someFunc2(someBool: true, chooseTrue: { () -> Void in print("chooseTrue")}, chooseFalse: { () -> Void in print("chooseFalse")})
someFunc2(someBool: false, chooseTrue: { () -> Void in print("chooseTrue")}, chooseFalse: { () -> Void in print("chooseFalse")})

someFunc2(someBool: false) {
    print("chooseTrue")
} chooseFalse: {
    print("chooseFalse")
}

//MARK: Захват значений
print("\n//Захват значений")

func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrement(forIncrement: 10)

print(incrementByTen())
print(incrementByTen())

let incrementBySeven = makeIncrement(forIncrement: 7)

print(incrementByTen())
print(incrementBySeven())
print(incrementBySeven())
print(incrementByTen())
print(incrementBySeven())


//MARK: Замыкания - ссылочный тип
print("\n//Замыкания - ссылочный тип")

print(incrementByTen())
let alsoIncrementbyTen = incrementByTen
print(alsoIncrementbyTen())


//MARK: Сбегающие замыкания
print("\n//Сбегающие замыкания")

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
 
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
 
let instance = SomeClass()

instance.doSomething()
print(instance.x)
// Выведет "200"
 
completionHandlers.first?()
print(instance.x)
// Выведет "100"

//----------

var completionHandlers2: [() -> Void] = []

func someFunctionWithEscapingClosure2(completionHandler: @escaping () -> Void) {
  completionHandlers2.append(completionHandler)
}

func someFunctionWithNonescapingClosure2(closure: () -> Void) {
    closure()
}

class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure2 { [self] in x = 100 }
        someFunctionWithNonescapingClosure2 { x = 200 }
    }
}

let instance2 = SomeOtherClass()
instance2.doSomething()
print(instance2.x)
// Выведет "200"
 
completionHandlers2.first?()
print(instance2.x)
// Выведет "100"
