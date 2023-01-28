struct Stock {
    let companyName: String
    var currentPrice: Double
    
    func description() {
        print("\(self.companyName) is \(self.currentPrice) points.")
    }
}

var appleStock = Stock(companyName: "Apple", currentPrice: 123.45)
appleStock.description()
