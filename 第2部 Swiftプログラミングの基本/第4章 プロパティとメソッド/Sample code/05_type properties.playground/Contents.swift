Double.pi
Int.max
Int.min

struct Some {
    static let constantTypeProperty = "ABC"
    static var variableTypeProperty = 123
    
    static var computedTypeProperty: Int {
        return 10 * self.variableTypeProperty
    }
}
Some.constantTypeProperty
Some.variableTypeProperty
Some.variableTypeProperty = 456
Some.variableTypeProperty
