/*:
 # repeat-while loops
 __`repeat-whileループ構文`__
 \
 \
 何度も同じコードを実行するプログラムを考えます。
 繰り返したい回数が事前に決まっていない場合は`while`ループを使うことができます。
 `while`ループは「指定した条件」を満たす間だけコードを繰り返します。
 \
 \
 例えば、特定の数が出るまでサイコロを転がすプログラムを考えます。

 以下に定義する`roll()`関数は、サイコロを振ったように`1`から`6`の整数をランダムに返します。
 
 ```swift
 func diceRoll() -> Int {
     return Int.random(in: 1...6)
 }
 ```

 ここでは`while`ループを使って、「出目が`1`になる」までサイコロを振るコードを繰り返すことにしましょう。

 ```swift
 var number = diceRoll()

 while number != 1 {
     number = diceRoll()
     print("You got \(number).")
 }
 ```
 
 サイコロの出目は変数`number`に保持します。
 そして`while`ループは「`number`が`1`ではない」という条件を満たす間、コードを繰り返します。

 ここで、ループの中と外で`diceRoll()`関数を呼び出している点に注目してください。
 どちらの呼び出しでも、関数の返り値を変数`number`に設定しているだけです。
 これはコードの重複であり、冗長といえます。
 \
 \
 最初の`diceRoll()`関数を削除して、ループの中だけで呼び出すようにしましょう。
 変数`number`は`Int`型であることだけを宣言して、既定値の設定を省略します。
 そして、whileループの条件に`true`を指定すると、無条件にコードを繰り返すことができます。

 ```swift
 var number: Int    // No default value assigned.

 while true {       // Repeat endlessly.
     number = diceRoll()
     print("You got \(number).")
 }
 ```
 
 `diceRoll()`関数の呼び出しを1箇所にまとめることができましたが、このままでは「コードの無限ループ」が発生してしまいます。
 そのような場合は`break`キーワードを使って、強制的にループから脱出できます。
 
 ```swift
 var number: Int

 while true {
     number = diceRoll()
     print("You got \(number).")
     if number == 1 {
         break
     }
 }
 ```

 ここでは、ifステートメントで「サイコロの出目が`1`になった」場合に`break`を実行します。
 \
 \
 このwhileループは要するに、繰り返したいコードが実行された後に「脱出する条件」を評価するループです。
 このような場合は、repeat-whileループを使用できます。
 repeat-whileループは、繰り返しコードが実行された後に条件を評価します。

 ```swift
 var number: Int

 repeat {
     number = diceRoll()
     print("You got \(number).")
 } while number != 1
 ```
 
 このrepeat-whileループは、サイコロを振った後に「出目が`1`ではない」ことを評価します。
 そのため、ループの中にあった「脱出する条件を評価するifステートメント」は削除できます。
 \
 \
 期待した分だけ正確にコードを繰り返すには、for-inループとwhileループおよびrepeat-whileループを使い分ける必要があります。
 そして、無限ループから脱出するためにはbreakキーワードを使用することも考えましょう。
 */
func diceRoll() -> Int {
    return Int.random(in: 1...6)
}

var number: Int

repeat {
    number = diceRoll()
    print("You got \(number).")
} while number != 1
