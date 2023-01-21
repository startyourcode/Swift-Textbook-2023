/*:
 # function with return value
 __`値を返す関数`__
 \
 \
 本当に便利な関数は、呼び出したら「それで終わり」ではありません。
 呼び出し元のコードに、関数の実行結果を返すことができます。
 \
 \
 例として、いくつかの四角形の面積を合計するプログラムを考えましょう。
 
 次のコードは、四角形の面積を計算する`area(height:width)`関数を定義します。
 
 ```swift
 func area(height: Int, width: Int) {
     let area = height * width
 }
 ```

 関数の呼び出し元に値を返すには、その旨を宣言しておく必要があります。
 実際には、宣言の最後に矢印と「返す値のデータ型」を追記します。
 
 ```swift
 func area(height: Int, width: Int) -> Int {
     let area = height * width
 }
 ```

 矢印は「ハイフン`-`と不等号`>`」を組み合わせて記述します。
 その直後に、「返す値の型」を明示します。
 この場合は、返すのは「整数同士を掛け算した値」なので、`Int`型になります。
 \
 \
 この時点で、コンパイラはエラーを報告します。
 関数は「値を返す」と宣言しているのに、ボディではそのように実装されていないことが原因です。

 エラーを解消するために、`return`キーワードを使って、定数`area`を呼び出し元に返します。
 
 ```swift
 func area(height: Int, width: Int) -> Int {
     let area = height * width
     return area
 }
 ```
 
 エラーが解消されて、プログラムは「四角形の面積」を再利用できるようになりました。
 `return`キーワードによって返される値を「関数の**返り値**」といいます。
 \
 \
 なお、関数の`return`キーワードは、「コードブロックが1行だけ」の場合には記述を省略できます。

 `area(height:width)`関数のコードブロックに注目してください。
 実際のところ、定数`area`を定義しなくても「面積を計算した結果」は返すことができます。
 
 ```swift
 func area(height: Int, width: Int) -> Int {
     return height * width
 }
 ```
 
 コードブロックが1行だけになったので、`return`キーワードを省略して暗黙的に値を返すことができます。

 ```swift
 func area(height: Int, width: Int) -> Int {
     height * width
 }
 ```

 コードブロックが1行だからといって、必ずしも暗黙的に値を返す必要はありません。
 とりあえず、このような方法で`return`キーワードが省略できることを覚えておきましょう。
 \
 \
 それでは、値を返す`area(height:width:)`関数を使って「小さい四角形の面積」を計算してみましょう。
 
 ```swift
 let smallRectangle = area(height: 3, width: 4) // 12
 ```

 関数の返り値は、定数`smallRectangle`として保持しておきます。
 \
 \
 同じようにして、「大きい四角形の面積」も計算します。
 
 ```swift
 let largeRectangle = area(height: 5, width: 6) // 30
 ```

 これらを足し算することで、面積の合計を得ることができます。
 
 ```swift
 print(smallRectangle + largeRectangle)     // Prints 42
 ```
 
 このようにして、関数は「呼び出し元のコードから値の受けとる」だけでなく、「呼び出し元に対して値を返す」ことができます。
 */
func area(height: Int, width: Int) -> Int {
    height * width
}

let smallRectangle = area(height: 3, width: 4)
let largeRectangle = area(height: 5, width: 6)
print(smallRectangle + largeRectangle)
