//
//  User.swift
//  SwiftOOP
//
//  Created by Ömer Faruk Kazar on 27.08.2022.
//

import Foundation

enum UserType {
    case AdminUser
    case NormalUser
    case UnauthorizedUser
}

class User {
    
    var name: String
    var age: Int
    var job: String
    var type: UserType
    private var phoneNumber: String = ""

    
    
    init(name: String, age: Int, job: String, type: UserType) {
        self.name = name
        self.age = age
        self.job = job
        self.type = type
    }
    
    func printUser() {
        print("\(name) is \(age) years old and his / her occupation is: \(job). \nUser Type:\(type)")
    }
    
    func getPhoneNumber(phoneNumber: String) { // Since phoneNumber is private we can't access it out from Scope.
        // Wrote a function in order to change that.
        self.phoneNumber = phoneNumber
    }
}

 
