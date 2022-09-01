import UIKit

// MARK: Closure
//  Tek kullanımlık fonksiyonlar
//

func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

sum(num1:5, num2: 5)

func calculate(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

func calculate( num1: Int, num2: Int, myFunction: (Int, Int) -> Int ) -> Int {
    return myFunction(num1, num2) // myFunction değişkenini İki int alıp bir int return etmesi gereken fonksiyon olarak tanımladık.
    // calculate fonksiyonunun return'üne de onu yazdık.
}

calculate(num1: 5, num2: 5, myFunction: sum) // sum fonksiyonunu parametre olarak pasladık.

// Buraya kadar fonksiyonu parametre olarak kullanmayı gördük şimdi closure kullanımını ve avantajlarını göreceğiz.

// Closure'ler tek kullanımlık isimsiz fonksiyonlardır.

calculate(num1: 5, num2: 2, myFunction: { (num1: Int, num2: Int) -> Int in
    return num1 * num2
}) // Tek seferlik kullanacaksak ve fonksiyon tanımalamk istemiyorsak böyle yapabiliriz.


calculate(num1: 5, num2: 2, myFunction: { (num1, num2) in
    return num1 * num2
})

calculate(num1: 5, num2: 2, myFunction: { $0 * $1 })



let myArray = [10, 20, 30, 40, 50]

func test(num1: Int) -> Int {
    return num1 / 5
}

myArray.map(test)
print(myArray.map({ $0 / 5 }))
