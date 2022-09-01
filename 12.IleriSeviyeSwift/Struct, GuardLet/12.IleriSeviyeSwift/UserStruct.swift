//
//  UserStruct.swift
//  12.IleriSeviyeSwift
//
//  Created by Ömer Faruk Kazar on 31.08.2022.
//

import Foundation

struct UserStruct {
    var name: String
    var age: Int
    var job: String
    
    mutating func increaseAgeByOne() {
        self.age += 1
    }
}
