//
//  UserClass.swift
//  12.IleriSeviyeSwift
//
//  Created by Ömer Faruk Kazar on 31.08.2022.
//

import Foundation

class UserClass {
    var name: String
    var age: Int
    var job: String
    
    init(name: String, age: Int, job: String) {
        self.name = name
        self.age = age
        self.job = job
    }
    
    func increaseAgeByOne() {
        self.age += 1
    }
    
}
