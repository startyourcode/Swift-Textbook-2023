/*:
 # removing element from array
 __`配列の要素を削除する`__
 \
 \
 配列の基本操作である「要素の削除」を学びます。
 `Array`型には、配列から要素を削除するための様々なメソッドが定義されてます。
 \
 \
 例として、買い物リストの配列からアイテムを削除していく方法を実践します。
 
 ```swift
 var shoppingList = ["Apple", "Banana", "Cheese", "Egg", "Milk"]
 ```

 この`shoppingList`配列の要素数は`5`で、有効なインデックスは`0`から`4`までの範囲です。
 \
 \
 配列の要素を削除する最もシンプルな方法は、`remove(at:)`メソッドを呼び出すことです。
 `remove(at:)`メソッドには「削除したい要素のインデックス」を指定します。

 次のコードは、先頭の要素である「りんご」を買い物リストから削除します。
 
 ```swift
 shoppingList.remove(at: 0)  // "Apple"
 print(shoppingList)
 // Prints ["Banana", "Cheese", "Egg", "Milk"]
 ```

 `remove(at:)`メソッドは「削除した要素」を返すので、後から「削除された要素」を参照することもできます。
 
 ```swift
 let removedItem = shoppingList.remove(at: 0)
 print(shoppingList)
 print("\(removedItem) is removed.")
 // Prints ["Banana", "Cheese", "Egg", "Milk"]
 // Prints Apple is removed.
 ```

 買い物リストには「バナナ、チーム、卵、ミルク」が残っています。
 \
 \
 先頭の要素を削除したい場合は、`removeFirst()`メソッドを使用することもできます。
 
 ```swift
 shoppingList.removeFirst() // "Banana"
 ```
 
 同様に、「最後の要素を削除する」ための`removeLast()`メソッドも用意されています。
 
 ```swift
 shoppingList.removeLast()  // "Milk"
 ```
 
 `removeLast()`メソッドを利用すると、「最後のインデックスはいくつか？」を確認する手間が省けます。
 ちなみに、`removeFirst()`メソッドと`removeLast()`メソッドも「削除した要素」を返します。
 \
 \
 これで、「バナナ」と「ミルク」が削除されて、買い物リストには「チーズ、卵」が残りました。
 
 ```swift
 print(shoppingList)    // Prints ["Cheese", "Egg"]
 ```

 配列からすべての要素を削除したい場合は、`removeAll()`メソッドを呼び出します。
 
 ```swift
 shoppingList.removeAll()
 ```
 
 これで、買い物リストからすべてのアイテムを消去できました。
 つまり、`shoppingList`配列は「空の配列」です。
 \
 \
 配列から要素を削除するメソッドは他にもいくつかあります。
 それらも含めた、どの方法で要素を削除する場合も「有効なインデックスの範囲」に注意してください。
 例えば、`remove(at:)`メソッドに無効なインデックスを指定したり、空の配列に対して`removeFrist()`メソッドを呼び出すことは不正です。
 そのようなコードを実行すると、ランタイムエラーが発生します。
 */
var shoppingList = ["Apple", "Banana", "Cheese", "Egg", "Milk"]

let removedItem = shoppingList.remove(at: 0)
print(shoppingList)
print("\(removedItem) is removed.")

shoppingList.removeFirst()
shoppingList.removeLast()
print(shoppingList)

shoppingList.removeAll()
