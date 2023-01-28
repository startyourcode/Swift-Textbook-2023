/*:
 # if statement and forced unwrapping
 __`if構文による安全な強制アンラップ`__
 \
 \
 オプショナル値の強制アンラップは慎重に行う必要があります。
 ここでは、その理由を説明します。
 
 次に定義する変数`optionalData`はオプショナルな`String?`型です。

 ```swift
 var optionalData: String?    // nil
 ```
 
 宣言したオプショナル値に既定値が設定されていない場合、自動的に`nil`になります。
 つまり、この変数`optionalData`は「値が存在しない」状態です。

 次のコードは、変数`optionalData`を強制アンラップします。

 ```swift
 optionalData!    // runtime error
 ```
 
 このコードは問題なくコンパイルされますが、実行すると即座にエラーが発生します。
 このような実行するまでコンパイラが検知できない不具合をランタイムエラーといいます。
 ランタイムエラーが実際のアプリケーションで発生すると、アプリはクラッシュして即座に終了し、ユーザーにストレスを与えます。
 \
 \
 ランタイムエラーを回避するため、Swiftは「プログラマーが明確に許可した場合」に限り、`nil`を扱えるように設計されています。
 `nil`はランタイムエラーの原因になる恐れがありますが、ifステートメントと比較演算子を利用することで、安全にオプショナル値を扱うことができます。
 
 次のコードは、オプショナル値を強制的にアンラップする前に「その値が`nil`ではない」ことを確認します。

 ```swift
 if optionalData != nil {
     print("You got \(optionalData!).")
 }
 ```
 
 `else`節を追加すれば、オプショナル値が`nil`だった場合にはそれをアンラップせずに、別のコードを実行できます。
 
 ```swift
 if optionalData != nil {
     print("You got \(optionalData!).")
 } else {
     print("There is no data...")
 }
 // Prints There is no data...
 ```
 */
var optionalData: Int?

if optionalData != nil {
    print("You got \(optionalData!).")
} else {
    print("There is no data...")
}
