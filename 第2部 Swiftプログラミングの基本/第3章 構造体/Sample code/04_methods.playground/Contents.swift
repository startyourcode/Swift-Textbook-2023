/*:
 # methods
 __`メソッド`__
 \
 \
 型に定義された定数と変数は、インスタンスプロパティとなって「データの状態」を示しました。
 それと同様に、型には関数を定義できます。
 型に定義された関数は**メソッド**と呼ばれ、「インスタンスに備わる機能」の役割を果たします。
 \
 \
 例として、ここでは「株式について、現在の株価を表示する」ための機能を実装しましょう。
 
 次のコードは、株式をモデル化した`Stock`型の構造体を定義します。
 
 ```swift
 struct Stock {
     let companyName: String
     var currentPrice: Double
 }
 ```

 2つのプロパティはそれぞれ、「銘柄の会社名」と「現在の株価」を示します。
 \
 \
 ここに、「株式について、現在の株価を表示する」ための`description()`メソッドを実装します。
 
 ```swift
 struct Stock {
     let companyName: String
     var currentPrice: Double

     func description() {
         print("\(self.companyName) is \(self.currentPrice) points.")
     }
 }
 ```
 
 メソッドは、通常の関数と全く同じ構文で定義できます。
 例えば、パラメータを宣言して値を受け取ったり、値を返すことも可能です。
 なお、`self`キーワードは「自身のインスタンス」を参照します。
 \
 \
 インスタンスを作成して、`description()`メソッドを呼び出してみましょう。

 ```swift
 var appleStock = Stock(companyName: "Apple", currentPrice: 123.45)
 appleStock.description()    // Prints Apple is 123.45 points.
 ```

 「Apple社の株価は123.45ポイント」であることを伝えるメッセージが出力されました。
 \
 \
 通常のメソッドは、作成されたインスタンスから呼び出されます。
 このような「インスタンスに備わったメソッド」を、特に**インスタンスメソッド**といいます。
 
 ちなみに、メソッドの実装における`self`キーワードは省略できます。
 
 ```swift
 struct Stock {
     let companyName: String
     var currentPrice: Double

     func description() {
         print("\(companyName) is \(currentPrice) points.")
     }
 }
 ```

 他のパラメータ名と重複しない限り、積極的に`self`キーワードは省略することが推奨されています。
 */
struct Stock {
    let companyName: String
    var currentPrice: Double
    
    func description() {
        print("\(self.companyName) is \(self.currentPrice) points.")
    }
}

var appleStock = Stock(companyName: "Apple", currentPrice: 123.45)
appleStock.description()
