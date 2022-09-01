//
//  main.swift
//  12.IleriSeviyeSwift
//
//  Created by Ömer Faruk Kazar on 31.08.2022.
//

import Foundation

/*
 
 // Struct: Inheritance yok, value type, immutable, stack (RAM) filo, daha hızlı ve daha basit.
 // Class: Inheritance var, reference type, mutable, heap (RAM) fifo, daha yavaş ve kompleks.
 // Eğer inheritance'ye ihtiyacın yoksa Struct kullanmalısın.
 
 let omerClass = UserClass(name: "Ömer", age: 26, job: "iOS Developer") // Class bir initializer tanımlamamız ya da property'lerin tümüne default value assign etmemiz gerekirken;
 //print(omerClass.name)
 
 var omerStruct = UserStruct(name: "Ömer", age: 26, job: "iOS Dev") // Struct için initializer otomatik olarak oluşturulur. Property'lere default value atamak opsiyoneldir.
 //print(omerStruct.name)
 
 omerClass.age = 25 // Class let ile tanımlanmış olsa da mutable
 print(omerClass.age)
 
 omerStruct.age = 25 // Struct property'lerinin mutable olması için var ile tanımlanmalı.
 print(omerStruct.age)
 
 //MARK: Reference Type & Value Type Differences
 let omerClassCopy = omerClass
 var omerStructCopy = omerStruct
 
 omerClassCopy.age = 20
 omerStructCopy.age = 20
 
 print("Copied class' age:\(omerClassCopy.age)\nOriginal class' age: \(omerClass.age)") // Class referance type olduğu için bir obje ve bunu refere eden iki pointer var. O yüzden referanslardan birisi o objeyi değiştirdiğinde, diğeri için de değişmiş olur.
 print("Copied struct's age: \(omerStructCopy.age)\nOriginal struct's age: \(omerStruct.age)") // Struct value type olduğu için iki ayrı obje oluşuyor. Bu yüzden yapılan değişiklikler birbirini etkilemez.
 
 //MARK: Mutability & Immutability Differences
 
 print("\nCurrent age of omerClass: \(omerClass.age)")
 omerClass.increaseAgeByOne() // Since Classes are mutable function defined as regular.
 print("After increaseAgeByOne Function called: \(omerClass.age)")
 
 print("\nCurrent age of omerStruct: \(omerStruct.age)")
 omerStruct.increaseAgeByOne() // Since Structs are immutable function have to be defined as mutating.
 print("After increaseAgeByOne Function called: \(omerStruct.age)")
 
 */

// MARK: Tuple
let myTuple = (1, 2, 3)
print(myTuple.0)

var myTuple2 = (first: 1, second: 2, third: 3)
print(myTuple2.second)

let myTuple3 = ("Ömer", [24, 25, 26], isMale: true)
print(myTuple3.0, myTuple3.1[2], myTuple3.isMale)

let predefinedTuple: (String, String)
predefinedTuple.0 = "Ömer Faruk"
predefinedTuple.1 = "Kazar"
print(predefinedTuple.0, predefinedTuple.1)


// MARK: if let & guard let
var optionalName: String? = "John Doe"

if let optionalName = optionalName { // if you can let the new variable optionalName equal the non-optional version of optionalName, do the following with it
    print("Hello, \(optionalName)") // This is unwrapped because it's the variable for if conditional statement
}

let numberString = "5"

func stringToIntIL(number: String) -> Int {
    if let numberInt = Int(number) { // Eğer bu atamayı yapabilirsen, if bloğunun içindekiler gerçekleştir. else kısmı optional
        return numberInt // if let kısmında oluşturduğumuz değişkene o blok dışından erişemiyoruz.
    } else {
        return 0
    }
}

print(stringToIntIL(number: numberString))

func stringToIntGL(number: String) -> Int {
    guard let numberInt = Int(number) else { // Bu atama başarısız olursa else bloğunun içindekileri gerçekleştir. Burada else yazmak zorundasın. Eğer başarılı olursa else'ye hiç uğramıyor zaten. Kalan kodu çalıştırmaya devam ediyor.
        return 0
    }
    return numberInt //guard let kısmında oluşturduğumuz değişkene o blok dışından da erişebiliyoruz.
}

// MARK: Switch - Case

let numberOfTheDay = 1
var nameOfTheDay = ""

switch numberOfTheDay {
case 1:
    nameOfTheDay = "Monday"
case 2:
    nameOfTheDay = "Tuesday"
case 3:
    nameOfTheDay = "Wednesday"
case 4:
    nameOfTheDay = "Thursday"
case 5:
    nameOfTheDay = "Friday"
case 6:
    nameOfTheDay = "Saturday"
default:
    nameOfTheDay = "Sunday"
}


// MARK: Breakpoint


var sayi = 5

print(sayi)
 // Uygulama breakpoint'in olduğu satırda durur ve değişkenlerin isimleri, fonksiyonlar, class'lar'ı listeler.
// Ayrıca
sayi += 1

print(sayi)
    
