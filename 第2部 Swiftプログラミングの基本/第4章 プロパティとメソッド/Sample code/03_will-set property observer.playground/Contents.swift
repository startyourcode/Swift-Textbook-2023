struct Some {
    var observedProperty: String {
        willSet {
            print("Now is \(self.observedProperty).")
            print("It will be \(newValue) soon.")
        }
    }
    
}

var something = Some(observedProperty: "Morning")
something.observedProperty = "Afternoon"
something.observedProperty
