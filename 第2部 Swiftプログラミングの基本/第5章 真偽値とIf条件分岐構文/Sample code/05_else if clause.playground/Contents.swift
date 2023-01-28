/*:
# else if clause
 __`if条件分岐構文のelse if節`__
 \
 \
 FizzBuzz問題は「数えた数が3の倍数ならFizzを、5の倍数ならBuzzを、3と5の公倍数ならFizzBuzzを出力する」アルゴリズムです。
 
 次のコードは「ある整数が`3`の倍数なら`Fizz`を、そうでなければ整数をそのまま出力する」条件分岐プログラムです。
 
 ```swift
 let number = 10

 if number.isMultiple(of: 3) {
     print("Fizz")
 } else {
     print(number)
 }
 ```

 このifステートメントに「5の倍数だったらBuzzを出力する」ための条件を追加しましょう。

 \
 \
 次のifステートメントは、ある整数`number`が`5`の倍数だったら`"Buzz"`を出力します。
 
 ```swift
 if number.isMultiple(of: 5) {
     print("Buzz")
 } else {
     print(number)
 }
 ```

 「3の倍数ではなく、5の倍数だったらBuzzを出力する」には、このifステートメントを「最初の条件分岐プログラムのelse節」に移動します。
 
 ```swift
 if number.isMultiple(of: 3) {
     print("Fizz")
 } else {
     if number.isMultiple(of: 5) {
         print("Buzz")
     } else {
         print(number)
     }
 }
 // Prints Buzz
 ```

 
 
 条件分岐コードを入れ子構造（ネスト）にすると、プログラムが読みにくくなる
 「それとも、別の条件」はelse-if節として、ifステートメントに追加できる

 次のコードは、
 
 ```swift
 if number.isMultiple(of: 3) {
     print("Fizz")
 } else if number.isMultiple(of: 5) {
     print("Buzz")
 } else {
     print(number)
 }
 // Prints Buzz
 ```
 
 このifステートメントを実行すると、「`"Buzz"`」が出力されます。
 
 else-if節はifステートメントにいくつでも追加できます。
 ifステートメントに幾つかの条件があった場合、上から順に条件が評価されます。
 そして、いずれかの条件がひとつでも満たされるとそれ以降の条件は評価されず、即座にifステートメントから脱出します。
 また、else節がifステートメントのいちばん下にあることにも注目してください。
 いずれの条件にも合致しなかった場合に実行されるelse節を追加する際は、常にifステートメントの最後に配置します。
 */
let number = 10

if number.isMultiple(of: 3) {
    print("Fizz")
} else {
    if number.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(number)
    }
}

