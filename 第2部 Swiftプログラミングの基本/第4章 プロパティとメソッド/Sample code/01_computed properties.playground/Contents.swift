/*:
 # computed properties
 __`計算プロパティ`__
 \
 \
 インスタンスの状態を「固定的な値」として保持する変数や定数のプロパティを、特に**格納プロパティ**といいます。
 格納プロパティにアクセスすると、固定的に設定されたその値を取得したり、新しい値に更新したりできます。
 
 Swiftの構造体は格納プロパティとは別に、**計算プロパティ**も定義できます。
 計算プロパティは値を固定的に設定しない代わりに、ゲッターとセッターを提供します。
 ゲッターは「状況に応じて算出した値」を返します。
 セッターは他のプロパティに値を設定できます。
 \
 \
 例として、正方形をモデル化した構造体の`EquilateralRectangle`型を定義します。
 
 ```swift
 struct EquilateralRectangle {
     var sideLength: Double
 }
 ```

 `sideLength`プロパティは「一辺の長さ」を示す`Double`型の変数です。
 \
 \
 ここに、「外周の長さ」を示す`perimeter`プロパティを宣言しましょう。
 正方形において、「外周の長さ」は「一辺の長さ」から算出できる値です。
 固定的に値を設定しない計算プロパティにすれば、`sideLength`プロパティに基づいて「外周の長さ」を算出できます。

 まず、変数の`perimeter`プロパティを宣言します。
 
 ```swift
 struct EquilateralRectangle {
     var sideLength: Double
     
     var perimeter: Double
 }
 ```

 計算プロパティを定義するには、変数にゲッターとセッターを実装します。
 ゲッターから実装しましょう。
 
 変数にゲッター節を実装するには、`get`キーワードを使います。
 そして、ゲッター節では`return`ステートメントで「その計算プロパティと同じ型の値」を返します。

 ```swift
 struct EquilateralRectangle {
     var sideLength: Double
     
     var perimeter: Double {
         get {
             return sideLength * 4.0
         }
     }
 }
 ```

 ここでは、「外周の長さ」を算出するために「一辺の長さを`4`倍」にしています。
 \
 \
 次に、`set`キーワードを使って、セッター節を実装します。
 セッターは、その計算プロパティに「新しい値」が設定されたときに実行するコードブロックです。
 セッター節では、`newValue`という識別子で「新たに設定された値」を参照できます。
 `perimeter`計算プロパティにおいて、`newValue`は「新たに設定された外周の長さ」を意味します。

 ```swift
 struct EquilateralRectangle {
     var sideLength: Double
     
     var perimeter: Double {
         get {
             return 4.0 * sideLength
         }
         set {
             sideLength = newValue / 4.0
         }
     }
 }
 ```

 ここでは、「`newValue`を`4`で除算した値」で`sideLength`プロパティを更新しています。
 \
 \
 それでは、計算プロパティのゲッターとセッターが正しく動作する様子を確認しましょう。
 
 正方形のインスタンスを作成して、`perimeter`プロパティにアクセスします。
 すると、ゲッターが実行されて「外周の長さ」を取得できます。
 
 ```swift
 var rectangle = EquilateralRectangle(sideLength: 1.2)
 rectangle.perimeter     // 4.8
 ```
 
 一辺の長さが`1.2`の正方形は、その外周の長さが`4.8`になります。
 \
 \
 `perimeter`プロパティに「新しい外周の長さ」を設定すると、セッターが実行されます。
 その結果、「一辺の長さ」を示す`sideLength`プロパティの値も更新されます。
 
 ```swift
 rectangle.perimeter = 6
 rectangle.sideLength    // 1.5
 ```

 「外周の長さ」が`6`に更新されたので、、「一辺の長さ」も`1.5`に更新されました。
 \
 \
 計算プロパティの実装においては、セッターが参照する識別子を「独自の名前」にカスタムすることもできます。
 
 コードを以下のように修正すると、セッター節では「新たに設定された値」を`newPerimeter`で参照できるようになります。
 
 ```swift
 struct EquilateralRectangle {
     var sideLength: Double
     
     var perimeter: Double {
         get {
             return 4.0 * sideLength
         }
         set (newPerimeter) {
             sideLength = newPerimeter / 4.0
         }
     }
 }
 ```
 
 計算プロパティのゲッターおよびセッターは常に、変数に対して実装します。
 定数プロパティに対して「計算プロパティのゲッターおよびセッター」を実装することはできません。
 ちなみに、クラスや列挙型といったデータ型でも、計算プロパティを定義できます。
 クラスや列挙型は、構造体とは別の方法でデータをモデル化する方法です。
 クラスと列挙型については詳しくは、別のセクションで解説します。
 */
struct EquilateralRectangle {
    var sideLength: Double
    
    var perimeter: Double {
        get {
            return sideLength * 4.0
        }
        set (newPerimeter) {
            sideLength = newPerimeter / 4.0
        }
    }
}

var rectangle = EquilateralRectangle(sideLength: 1.2)
rectangle.perimeter
rectangle.perimeter = 6
rectangle.sideLength
