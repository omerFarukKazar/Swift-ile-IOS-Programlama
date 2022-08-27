//
//  SpecialUser.swift
//  SwiftOOP
//
//  Created by Ömer Faruk Kazar on 27.08.2022.
//

import Foundation

class SpecialUser: User { // User Class'ını parent olarak belirledik. User Class'ının tüm property ve methodlarını inheritance yoluyla aldık.
    
    func newFunction() {
        print("New Function Used.")
    }
    
    override func printUser() { // Bu fonksiyon halihazırda inheritance aldığımız parent class'ta bulunduğu için onu ancak oerride func  yazarak burada kullanabiliriz.
        super.printUser() // Parent Class'taki method ya da properties'e erişmek istersen super. şeklinde kullanmalısın.
        print("Used override func on SpecialUser Class.")
    }
    
    private func testFunction() {
        print("Test")
    }
    
}

//MARK: Access Leveles
// Neye nereden erişilebileceğini belirler.
// Beş farklı seviye vardır. En açık seviyeden en kısıtlı olana doğru aşağıda sırasıyla belirtildiği gibi...
// open, public, internal, fileprivate, private
// open: Her yerden (
// public: Modüller içerisinde (
// internal: Değişken ve Fonksiyonlarda hiçbi şey belirtmediysek aslında defaul olarak internal tanımlıyoruz.
// fileprivate: Dosyanın dışından erişilebilir
// private: Sadece ve sadece sınıf içerisinde erişilebilir.
