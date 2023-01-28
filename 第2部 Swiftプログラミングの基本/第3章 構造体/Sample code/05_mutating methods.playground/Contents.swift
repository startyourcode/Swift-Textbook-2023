/*:
 # mutating methods
 __`自己可変メソッド`__
 \
 \
 呼び出したインスタンス自身を操作するメソッドはとても有用です。
 Swiftにあらかじめ用意されているメソッドにも、「インスタンス自身を操作するもの」と「そうでないもの」があります。
 \
 \
 ここでは「インスタンス自身を操作するメソッド」の例として、「株価の値動きを追跡する」ためのプログラムを考えましょう。
 
 次のコードは、株式をモデル化した`Stock`型の構造体を定義します。
 
 ```swift
 struct Stock {
     var previousPrice = 0.0
     var currentPrice: Double
 }
 ```

 2つのプロパティはそれぞれ、「以前の株価」と「現在の株価」を示します。
 「以前の株価」を示す変数の`previousPrice`プロパティにだけ、既定値にゼロを設定しておきます。
 \
 \
 次に、株価を更新するための`update(amount:)`メソッドを定義しましょう。
 このメソッドでは最初に、「以前の株価」に「現在の株価」を設定します。
 その後、`currentPrice`プロパティの値を「受け取ったパラメータ」で更新します。
 
 ```swift
 struct Stock {
     var previousPrice = 0.0
     var currentPrice: Double
         
     func update(amount: Double) {
         previousPrice = currentPrice
         currentPrice += amount
     }
 }
 ```

 すると、コンパイラはエラーを報告します。
 これは「自身のインスタンスが変更不可（イミュータブル）である」ことが原因です。
 原則として、構造体のメソッドは「自身のインスタンス」について、状態を変更できません。
 それが変数プロパティであっても、通常のメソッドは「インスタンスの状態」を変更できません。
 \
 \
 このエラーを解消するには、メソッドの先頭に`mutating`キーワードをマークします。
 すると、メソッドが自己可変（ミュータブル）になり、インスタンスの状態を変更できるようになります。
 
 ```swift
 struct Stock {
     var previousPrice = 0.0
     var currentPrice: Double
     
     mutating func update(amount: Double) {
         previousPrice = currentPrice
         currentPrice += amount
     }
 }
 ```

 この仕組みによって、意図せずに「インスタンスの状態」を変更してしまうことを回避できます。
 \
 \
 ミュータブルなメソッドも、イミュータブルなメソッドも呼び出し方は同じです。
 
 次のコードは、「Apple社の株式」を示す変数インスタンスを作成して、株価を更新します。
  
 ```swift
 var appleStock = Stock(currentPrice: 123.45)
 appleStock.update(amount: 1.11)
 ```
 
 サイドバーで実行結果を表示すると、2つのプロパティ値が更新されていることを確認できます。
 \
 \
 ちなみに、ミュータブルなメソッドは「定数インスタンスからは呼び出せない」ようになっています。
 
 ```swift
 let goggleStock = Stock(currentPrice: 86.56)
 goggleStock.update(amount: 2.34)  // error; Cannot use mutating member on immutable value
 ```
 
 構造体の定数インスタンスはプロパティを変更できないのに、ミュータブルなメソッドを呼び出すことはナンセンスです。
 このようなコードはコンパイル時にエラーが報告されます。
 この仕組みのおかげで、実行時になってアプリがクラッシュすることを回避できます。
 */
struct Stock {
    var previousPrice = 0.0
    var currentPrice: Double
    
    mutating func update(amount: Double) {
        previousPrice = currentPrice
        currentPrice += amount
    }
}

var appleStock = Stock(currentPrice: 123.45)
appleStock.update(amount: 1.11)

let goggleStock = Stock(currentPrice: 86.56)
//goggleStock.update(amount: 2.34)
