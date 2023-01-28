/*:
 # type properties
 __`型プロパティ`__
 \
 \
 通常のプロパティは、インスタンス毎に別個の状態を保持します。
 つまり、特定のデータ型からインスタンスがいくつか作成された場合、それぞれのプロパティは独立していることを意味します。
 このような、インスタンス毎に備わるプロパティを**インスタンスプロパティ**といいます。
 対照的に、インスタンスではなく「型自体に備わるプロパティ」を**型プロパティ**といいます。
 他のプログラミング言語によっては、型プロパティのことを**静的プロパティ**という場合もあります。
 ある型のインスタンスがいくつ作成されても、その型に備わる型プロパティの値は「すべてのインスタンスで共通するひとつ」だけです。
 \
 \
 標準ライプラリの`Int`型や`Double`型にも型プロパティが定義されています。
 
 ```swift
 Double.pi  // 3.141592653589793
 Int.max    // 9223372036854775807
 Int.min    //-9223372036854775808
 ```
 
 `Double`型の`pi`プロパティを参照すると、円周率を取得できます。
 `Int`型の`max`プロパティと`min`プロパティはそれぞれ、Swiftが扱える整数の最大値と最小値を返します。
 \
 \
 実際に、型プロパティを定義してみましょう。
 ここでは、以下に定義する構造体の`Some`型を例に挙げます。

 ```swift
 struct Some {
 }
 ```
 
 インスタンスプロパティと同じく、型プロパティにも変数と定数があります。
 
 型プロパティを定義するには、通常のプロパティに`static`キーワードをマークします。
 
 ```swift
 struct Some {
     static let constantTypeProperty = "ABC"
     static var variableTypeProperty = 123
 }
 ```
 
 インスタンスプロパティとは異なり、型プロパティを定義する際は必ず既定値を設定します。
 これは、型自体には「型プロパティに値を設定する初期化手続き」がないからです。
 \
 \
 型プロパティには、インスタンスを作成することなく、型に直接ドットシンタックスを介してアクセスします。
 
 ```swift
 Some.constantTypeProperty  // "ABC"
 Some.variableTypeProperty  // 123
 ```
 
 変数の型プロパティはインスタンスプロパティと同じく、代入演算子`=`を使って値を更新できます。

 ```swift
 Some.variableTypeProperty = 456
 Some.variableTypeProperty  // 456
 ```

 さらに、インスタンスの計算プロパティと同じように、型プロパティも計算値を返すことができます。
 型の計算プロパティも変数である必要があります。
 
 ```swift
 struct Some {
     static let constantTypeProperty = "ABC"
     static var variableTypeProperty = 123

     static var computedTypeProperty: Int {
         return 10 * self.variableTypeProperty
     }
 }
 ```
 
 型プロパティの実装において、`self`キーワードは「自身の型」を参照します。
 */
Double.pi
Int.max
Int.min

struct Some {
    static let constantTypeProperty = "ABC"
    static var variableTypeProperty = 123
    
    static var computedTypeProperty: Int {
        return 10 * self.variableTypeProperty
    }
}
Some.constantTypeProperty
Some.variableTypeProperty
Some.variableTypeProperty = 456
Some.variableTypeProperty
