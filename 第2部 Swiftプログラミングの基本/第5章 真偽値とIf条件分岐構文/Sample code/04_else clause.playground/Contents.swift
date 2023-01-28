/*:
 # else clause
 __`else節`__
 \
 \
 ifステートメントには条件を満たす場合に限り実行したいコードを記述できます。
 ifステートメントにelse節を追加すると、条件を満たさなかった場合に実行したいコードを記述できます。

 例えば、次のコードは「定数`number`が`3`の倍数」である場合に限り、コンソールに`"Fizz"`を出力する条件分岐プログラムです。
 
 ```swift
 let number = 10

 if number.isMultiple(of: 3) {
     print("Fizz")
 }
 // Prints nothing.
 ```

 整数インスタンスの`isMultiple(of:)`メソッドは、その整数が指定した数の倍数なら`true`を返します。
 定数`number`は`10`なので、`3`の倍数ではありません。
 したがって、このifステートメントを実行してもコンソールには何も出力されません。
 \
 \
 条件を満たさなかった場合のコードを記述するため、このifステートメントに`else`節を追加しましょう。
 `else`節は常に、ifステートメントのいちばん最後に配置します。

 ```swift
 if number.isMultiple(of: 3) {
     print("Fizz")
 } else {
     // do something...
 }
 ```
 
 定数`number`が`3`の倍数ではない（つまり、`isMultiple(of:)`メソッドが`false`を返した）場合は、整数をそのまま出力することにします。
 
 ```swift
 if number.isMultiple(of: 3) {
     print("Fizz")
 } else {
     print(number)
 }
 // Prints 10
 ```

 再度、このifステートメントを実行するとコンソールに`10`が出力されます。
 */
let number = 10

if number.isMultiple(of: 3) {
    print("Fizz")
} else {
    print(number)
}
