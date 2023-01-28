/*:
 # optional return types
 __`オプショナルを返す関数`__
 \
 \
 オプショナルは関数の返り値やパラメータとしても利用できます。
 Swift標準ライブラリやフレームワークにも、オプショナルを返す関数はたくさん存在します。
 「通常の関数」と「オプショナルを返す関数」を比較して、どのような違いがあるのかを理解しましょう。
 \
 \
 次のコードは、通常の`String`値を返す関数を定義します。
  
 ```swift
 func someMethod() -> String {
     return "Abracadabra"
 }
 ```
 
 呼び出してコンソール出力すると、返り値が「通常の文字列」であることを確認できます。
 
 ```
 let value = someMethod()
 print(vallue)   // Prints Abracadabra
 ```
 
 関数がオプショナル値を返せるようにするには、返り値をオプショナル型として宣言します。
 
 ```swift
 func someMethod() -> String? {
     return "Abracadabra"
 }
 ```
 
 すると、関数の返り値は常にオプショナルでラップされます。
 
 ```swift
 let value = someMethod()
 print(vallue)   // Prints Optional("Abracadabra")
 ```

 ここで、関数のボディに注目してください。
 returnステートメントは「通常の文字列値」を返しています。
 しかしながら、実際には宣言した通り、返り値はオプショナルでラップされました。
 \
 \
 オプショナルを返す関数を呼び出したら、その返り値が`nil`かもしれないことを考慮すべきです。
 
 ```
 let value = someMethod()
 print(value ?? "Nil returned...")   // Prints Abracadabra
 ```
 
 ここではnil結合演算子を使って、安全にアンラップしました。
 \
 \
 オプショナルを返す関数は、意図的に`nil`を返すこともできます。

 この関数を修正して、`Bool`型のパラメータを受け取るようにします。
 そして、受け取った`Bool`値が`true`だったら`nil`を返します。

 ```swift
 func someMethod(isReturnNil: Bool) -> String? {
     return isReturnNil ? nil : "Abracadabra"
 }
 ```
 
 この関数を実際に呼び出して、`nil`を返してみましょう。
 
 ```swift
 let value = someMethod(isReturnNil: true)
 print(value ?? "Nil returned...")  // Prints Nil returned...
 ```
 
 関数が意図的に`nil`を返すことで、呼び出し元に「期待した結果が得られなかった」ことを伝えられます。
 逆説的には、オプショナルを返す関数は「その手続きが常に成功するとは限らない」ことを意味します。
 */
func someMethod(isReturnNil: Bool) -> String? {
    return isReturnNil ? nil : "Abracadabra"
}

let value = someMethod(isReturnNil: true)
print(value ?? "Nil returned...")
