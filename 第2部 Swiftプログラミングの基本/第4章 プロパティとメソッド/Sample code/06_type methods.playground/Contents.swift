Int.random(in: 1...3)
Double.random(in: 0...1)

struct Some {
    static let number = 123

    static func typeMethod(_ number: Int) {
        print("Type method is executed!")
        print("Type method received \(number).")
        print("The value of the type property is \(self.number).")
        anotherTypeMethod()
    }
    
    static func anotherTypeMethod() {
        print("Another type method is executed!")
    }
}
Some.typeMethod(456)
