/*:
 # function with multiple parameters
 __`いくつかのパラメータを受け取る関数`__
 \
 \
 関数が受け取ることができるパラメータは一つだけではありません。
 カンマ記号`,`でパラメータを区切って、受け取るパラメータをいくつも並べることができます。

 例として、「四角形の面積」を計算する`area()`関数を定義しましょう。
 
 ```swift
 func area() {
 }
 ```

 四角形の面積は「高さと横幅の掛け算」で計算できます。
 つまり、ふたつの値を受け取る必要があります。
 
 関数名の直後にある括弧`()`は**パラメータリスト**です。
 この中に「`Int`型のパラメータ」として`height`と`width`を宣言しましょう。
 
 ```swift
 func area(height: Int, width: Int) {
 }
 ```

 コードブロックの中で、これらのパラメータを掛け算して面積を計算します。
 計算した結果はコンソールに出力しましょう。
 
 ```swift
 func area(height: Int, width: Int) {
     print(height * width)
 }
 ```

 面積を計算できる`area(_:_:)`関数を定義できました。
 \
 \
 実際に呼び出して、計算してみましょう。
 
 ```swift
 area(height: 3, width: 5)      // Prints 15
 ```

 縦横のサイズが`3 * 5`の四角形について、面積を計算できました。
 
 パラメータをにして宣言すれば、関数は必要な分だけ値を受け取ることができます。
 */
func area(height: Int, width: Int) {
    print(height * width)
}
area(height: 3, width: 5)
