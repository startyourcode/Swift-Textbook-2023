struct Some {
    var observedProperty: String = "Afternoon" {
        willSet {
            print("Now is \(observedProperty).")
            print("It will be \(newValue) soon.")
        }
        didSet {
            print("\(oldValue) did change to \(observedProperty).")
            print("Now is \(observedProperty).")
        }
    }
}
var something = Some()
something.observedProperty = "Evening"
