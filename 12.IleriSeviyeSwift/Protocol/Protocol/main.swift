//
//  main.swift
//  Protocol
//
//  Created by Ömer Faruk Kazar on 1.09.2022.
//

import Foundation

// Protocol başka sınıflarda veya struct'larda kullanılmak için var.
protocol Running {
    func myRunProtocol()
}

class Animal {
    func canRun() {
        print("Run by Animal Class")
    }
}

class Dog: Animal {
    
}
let hachi = Dog()

class Cat: Animal, Running {
    func myRunProtocol() {
        print("Run by Running Protocol")
    }
}
let mila = Cat()

class Turtle: Animal {
    
}
let leonardo = Turtle()


hachi.canRun(); mila.myRunProtocol(); mila.canRun()

