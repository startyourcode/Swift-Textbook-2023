/*:
 # string concatenation
 __`文字列を結合する`__
 \
 \
 Swiftの加算演算子`+`は、文字列同士を足し算することもできます。
 
 ```
 "abc" + "def"    // abcdef
 ```
 
 このような処理は、文字列の**結合**または**連結**と呼ばれます。
 \
 \
 ただし、以下のような加算処理を実行しようとすると、コンパイラはエラーを報告します。
 
 ```swift
 "123" + 456 // error
 ```

 これは、二つの被演算子が互いに`String`型と`Int`型の異なるデータ型だからです。
 Swiftプログラミングでは、異なるデータ型同士を演算できないルールがあります。
 安全なプログラムを実行するための重要なルールなので、覚えておきましょう。
 */
"abc" + "def"
//"123" + 456 // error
