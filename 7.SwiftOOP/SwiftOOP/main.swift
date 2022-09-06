//
//  main.swift
//  SwiftOOP
//
//  Created by Ömer Faruk Kazar on 27.08.2022.
//

import Foundation

let omer = User(name: "Ömer", age: 27, job: "iOS Developer", type: .AdminUser)
let meryem = User(name: "Meryem", age: 25, job: "Nurse", type: .NormalUser)

print(omer.job)
print(omer.printUser())

let faruk = SpecialUser(name: "Faruk", age: 27, job: "Teacher", type: .UnauthorizedUser)
print(faruk.job)

faruk.printUser()
faruk.newFunction()

omer.getPhoneNumber(phoneNumber: "1234563556")
