/*:
 # nil-coalescing operator
 __`Nil結合演算子`__
 \
 \
 読みやすく簡潔なコードを見ると、プログラマーは良い気分になります。
 反対に、単純な動作なのに冗長なコードを見ると、滅入ってしまうかもしれません。
 ここでは例として、オプショナルを扱う単純なコードを考えてみましょう。
 \
 \
 次のコードは「自分の気持ち」を保持する変数を、オプショナルな`String?`型として定義します。

 ```swift
 var myFeeling: String? = "😀"
 ```
 
 例えば、幸せな気持ちなら`"😀"`と設定できます。
 \
 \
 変数`myFeeling`が`nil`だった場合、不用意にアンラップするとランタイムエラーを発生します。
 そのため、実際のプログラムではオプショナル値を`nil`と比較して、安全にアンラップすべきです。
  
 ```swift
 if myFeeling != nil {
     print(myFeeling!)
 } else {
     print("No feeling...")
 }
 Prings 😀
 ```

 このifステートメントは問題なく動作しますが、単純な内容の割に冗長な印象があります。

 三項演算子を使うと、同じプログラムを1行のコードで記述できます。
 
 ```swift
 print(myFeeling != nil ? myFeeling! : "No feeling...") // Prints 😀
 ```
 
 オプショナルから値を取り出すために、安全にアンラップする`if`ステートメントを1行で記述できました。
 しかしながら、ひとつの行で同じ識別子を2回も記述しているので、まだ冗長な印象があります。
 \
 \
 このようなコードはNil結合演算子`&&`を使って、さらに簡潔に記述できます。
 
 ```swift
 print(myFeeling ?? "No feeling...")
 // Prints 😀
 ```
 
 このような簡潔で読みやすいコードを読むと、プログラマーは嬉しくてワクワクします。
 オプショナル値を扱うコードが冗長になってしまった場合は、Nil結合演算子`??`が利用できないか検討してみましょう。
 */
var myFeeling: String? = "Happy"

if myFeeling != nil {
    print(myFeeling!)
} else {
    print("No feeling...")
}

print(myFeeling ?? "No feeling...")
