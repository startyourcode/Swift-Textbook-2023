var shoppingItems = ["egg": 4, "banana": 1, "ice cream": 3]

shoppingItems["egg"] = 5
shoppingItems.updateValue(2, forKey: "banana")

if let oldValue = shoppingItems.updateValue(1, forKey: "ice cream") {
    print("Previously, there were \(oldValue) ice creams.")
}

shoppingItems["banana"] = nil

print(shoppingItems)

