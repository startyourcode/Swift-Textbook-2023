struct Stock {
    let companyName: String
    var currentPrice: Double
}

var appleStock = Stock(companyName: "Apple", currentPrice: 138.88)
appleStock.currentPrice = 139.99
//appleStock.companyName = "Apple Computer"

let microsoftStock = Stock(companyName: "Microsoft", currentPrice: 214.25)
//microsoftStock.currentPrice = 215.25
