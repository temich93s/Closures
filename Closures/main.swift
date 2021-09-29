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
