var shoppingList = ["Apple", "Banana", "Cheese", "Egg", "Milk"]

let removedItem = shoppingList.remove(at: 0)
print(shoppingList)
print("\(removedItem) is removed.")

shoppingList.removeFirst()
shoppingList.removeLast()
print(shoppingList)

shoppingList.removeAll()
