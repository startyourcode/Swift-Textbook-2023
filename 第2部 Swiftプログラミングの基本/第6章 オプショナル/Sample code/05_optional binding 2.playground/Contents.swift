/*:
 # optional binding part2
 __`オプショナル・バインディングを列挙する`__
 \
 \
 いくつかのオプショナル値を同時に扱う場合は、どのようにアンラップできるでしょうか？
 ここでは例として、旅行の出発地と目的地が決まったら出発するプログラムを考えます。
 
 次のコードは、出発地と目的地をオプショナルな`String?`型として宣言します。

 ```swift
 let departure: String? = "Tokyo"
 let destination: String? = "Osaka"
 ```

 「東京を出発して、大阪に向かう」ことが決定しました。
 \
 \
 オプショナル・バインディングでひとつずつアンラップする場合、ifステートメントをネストして次のように記述できます。
 
 ```swift
 if let departure {
     if let destination {
         print("Depart from \(departure) for \(destination).")
     }
 }
 // Prints Depart from Tokyo for Osaka.
 ```

 ふたつのオプショナル値を安全に扱えましたが、ネストされた制御構文は複雑になりがちです。

 オプショナル・バインディングはカンマ記号`,`で区切って、列挙できます。
 
 ```swift
 if let departure, let destination {
     print("Depart from \(departure) for \(destination).")
 }
 // Depart from Tokyo for Osaka.
 ```

 注意すべき点として、列挙したオプショナル・バインディングは先頭から順に評価されることが挙げられます。
 そして、オプショナル・バインディングがひとつでも`nil`だった場合、`if`ステートメント全体が`false`と評価されます。
 
 出発地と目的地がひとつでも`nil`になると、条件全体が`false`と評価されて、else節のコードが実行されます。

 ```swift
 let departure: String? = "Tokyo"
 let destination: String? = nil     // change to nil.

 if let departure, let destination {
     print("Depart from \(departure) for \(destination).")
 } else {
     print("Determine your departure and destination.")
 }
 // Prints Determine your departure and destination.
 ```
 
 また、列挙されたオプショナル・バインディングは先頭から順に評価されるので、出発地が`nil`だった場合はその時点で評価式全体が`false`になります。
 したがって、目的地が評価されることはありません。
 このような仕組みは短絡評価（*short-circuit evaluation*）として知られています。
 */
let departure: String? = "Tokyo"
let destination: String? = nil

if let departure, let destination {
    print("Depart from \(departure) for \(destination).")
} else {
    print("Determine your departure and destination.")
}


