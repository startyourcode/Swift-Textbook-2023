/*:
 # customizing initialization
 __`独自の初期化手続きを実装する`__
 \
 \
 自動的に提供されるイニシャライザの他に、プログラマーが「独自の初期化手続き」を実装することもできます。
 「独自の初期化手続き」を行うイニシャライザなら、より便利にインスタンスを作成できるようになります。
 ここでは、独自の初期化手続きを行うためにカスタムされたイニシャライザを実装します。
 \
 \
 例として、円の図形をモデル化する構造体として、`Circle`型を定義します。
 
 ```swift
 struct Circle {
     let radius: Double
     let diameter: Double
 }
 ```

 2つの定数プロパティはそれぞれ、「円の半径」と「直径」を示します。

 なお、`Circle`型のプロパティにはいずれも既定値が設定されていないので、メンバーワイズイニシャライザが自動的に提供されます。
 
 ```swift
 let smallCircle = Circle(radius: 2, diameter: 4)
 ```
 
 このメンバーワイズイニシャライザでは「円の半径」と「直径」を指定します。
 しかしながら、同じ円における「半径」と「直径」を個別に指定することはナンセンスです。
 どちらか一方だけを指定すれば、もう片方は計算できます。
 \
 \
 「円の半径」だけを指定するイニシャライザを独自に定義しましょう。
 独自のイニシャライザは`init`キーワードを使って定義します。
 
 以下のコードは、`Circle`型に「指定された半径`r`に基づいて、プロパティを初期化する」イニシャライザを実装します。
 
 ```swift
 struct Circle {
     let radius: Double
     let diameter: Double
     
     init(r: Double) {
         self.radius = r
         self.diameter = r * 2
     }
 }
 ```

 ここでは、インスタンスの`radius`プロパティに半径`r`を設定しています。
 そして、`diameter`プロパティには「半径を`2`倍して算出した直径」を設定します。
 \
 \
 構造体に「独自のイニシャライザ」が定義されると、標準イニシャライザとメンバーワイズイニシャライザは提供されなくなります。
 したがって、定数`smallCircle`を作成したメンバーワイズイニシャライザの呼び出しに対して、コンパイラはエラーを報告します。

 コードを修正して、独自のイニシャライザを呼び出しましょう。
 
 ```swift
 let smallCircle = Circle(r: 2)
 ```

 エラーは解消されて、先ほどと同じインスタンスが作成されます。
 \
 \
 独自のイニシャライザを定義したので、`Circle`型には「自動的に提供されるイニシャライザ」はありません。
 しかしながら、標準イニシャライザやメンバーワイズイニシャライザは、プログラマーが明示的に実装することもできます。
 
 例えば、パラメータを指定することなくインスタンスを作成できる標準イニシャライザはとても便利です。
 標準イニシャライザと同じ形式で呼び出せる初期化手続きを独自に定義しましょう。
 
 `Circle`型に「パラメータを受け取らないイニシャライザ」を定義します。
 
 ```swift
 struct Circle {
     let radius: Double
     let diameter: Double
     
     init(r: Double) {
         self.radius = r
         self.diameter = r * 2
     }
     
     init() {
         self.radius = 1.0
         self.diameter = 2.0
     }
 }
 ```
 
 このイニシャライザによって作成される円のインスタンスは、いわゆる単位円です。
 単位円とは「半径の大きさが`1`の円」です。
 \
 \
 このイニシャライザは、標準イニシャライザと同じ形式で呼び出せます。
 
 ```swift
 let unitCircle = Circle()
 ```

 ここまで見てきた通り、イニシャライザに個別の識別子はありません。
 パラメータリストは`init`キーワードの直後に宣言します。
 その点が、通常のメソッドとは異なります。
 それ以外はメソッドと同じように、ボディでは`self`で自身のインスタンスを参照できます。
 この`self`を省略できる点も、メソッドと同じです。

 ```swift
 struct Circle {
     let radius: Double
     let diameter: Double
     
     init(r: Double) {
         radius = r         // omit self
         diameter = r * 2   // omit self
     }
     
     init() {
         radius = 1.0       // omit self
         diameter = 2.0     // omit self
     }
 }
 ```
 :*/
struct Circle {
    let radius: Double
    let diameter: Double
    
    init(r: Double) {
        radius = r
        diameter = r * 2
    }
    
    init() {
        radius = 1.0
        diameter = 2.0
    }
}

let circle = Circle(r: 2)
let unitCircle = Circle()
