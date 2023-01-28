/*:
 # logical AND operator
 __`論理積算子`__
 \
 \
 FizzBuzzアルゴリズムにおいて、「FizzBuzz」が出力される条件は「ある整数が`3`と`5`の公倍数である」場合です。
 これはつまり、以下に挙げる二つの条件を同時に満たすことを意味します。
 - ひとつは、ある整数が`3`の倍数であること。
 - もうひとつは、ある整数が`5`の倍数であることです。
 
 ふたつの条件が満たされる場合にコードを実行する条件分岐プログラムは、ifステートメントをネストして構築できます。
 
 以下のネストしたifステートメントは「ある整数`number`が`3`の倍数であり、`5`の倍数でもある」場合、コンソールに`"FizzBuzz"`と出力します。
 
 ```swift
 let number = 15

 if number.isMultiple(of: 3) {
     if number.isMultiple(of: 5) {
         print("FizzBuzz")
     }
 }
 // Prints FizzBuzz
 ```

 `15`は`3`と`5`の公倍数です。
 つまり、「`3`の倍数かつ`5`の倍数」なので、このプログラムを実行すると「`"FizzBuzz"`」が出力されます。
 しかしながら、ネストが深いコードは読みにくくなるので、このようなifステートメントの使い方は極力避けるべきです。
 \
 \
 論理積演算子`&&`を使うことで、ネストしたifステートメントを簡潔に記述できます。
 論理積とは、「ふたつの条件が両方とも`true`である場合に限り、式全体が`true`を返す」演算です。
 
 例えば、整数`10`は`2`と`5`の公倍数なので、「`2`の倍数であること」と「`5`の倍数であること」を同時に満たします。
 
 ```swift
 let ten = 10
 ten.isMultiple(of: 2) && ten.isMultiple(of: 5)  // true
 ```
 
 どちらか一方の条件でも満たされなかった場合、論理積演算の式は`false`を返します。
 
 ```swift
 let ten = 10
 ten.isMultiple(of: 2) && ten.isMultiple(of: 5)
 ten.isMultiple(of: 2) && ten.isMultiple(of: 6)  // false
 ```

 `10`は`2`の倍数ですが、`6`の倍数ではありません。
 したがって、2つ目の論理積の演算式は`false`を返します。
 \
 \
 論理積演算子`&&`を使用すると、先ほどのネストしたifステートメントは以下のように記述を改善できます。
 
 ```swift
 if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
     print("FizzBuzz")
 }
 // Prints FizzBuzz
 ```
 
 実行した結果に変わりはありませんが、ネストが解消されて読みやすいコードになりました。
 \
 \
 このifステートメントに「`3`の倍数である場合」と「`5`の倍数である場合」および「それら以外の場合」の分岐を追加しましょう。
 そうすることで、FizzBuzzアルゴリズムが完成します。
  
 ```swift
 if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
     print("FizzBuzz")
 } else if number.isMultiple(of: 3) {
     print("Buzz")
 } else if number.isMultiple(of: 5) {
     print("Fizz")
 } else {
     print(number)
 }
 ```
 
 このifステートメントでは、「3と5の公倍数であるかどうか」を評価する論理式が最初の条件文になっている点に注目してください。
 ifステートメントの条件文は上から順に評価されます。
 したがって、「3の倍数であるか」や「5の倍数であるか」を先に評価してしまうと、FizzBuzzアルゴリズムは正しく動作しません。
 そうした場合、整数が`15`や`30`であっても、`3`の倍数あるいは`5`の倍数として評価されてしまいます。
 */
let number = 15

if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
    print("FizzBuzz")
} else if number.isMultiple(of: 3) {
    print("Fizz")
} else if number.isMultiple(of: 5) {
    print("Buzz")
} else {
    print(number)
}

let ten = 10
ten.isMultiple(of: 2) && ten.isMultiple(of: 5)  // true
ten.isMultiple(of: 2) && ten.isMultiple(of: 6)  // false
