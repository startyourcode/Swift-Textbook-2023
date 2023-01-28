/*:
 # stored properties of constant structure instances
 __`構造体の定数インスタンスとそのプロパティ`__
 \
 \
 構造体のプロパティは「型に定義された変数および定数」です。
 それが変数であっても定数であっても、プロパティは「インスタンスの状態（ステート）」を示す値を保持します。
 そのようなプロパティを、特に**格納プロパティ**（Stored Property）といいます。
 ただし、定数プロパティは最初に設定された値を、その後で更新できません。
 \
 \
 例として、株価を追跡するためのプログラムを考えます。
 
 次のコードは、「株価」をモデル化する構造体として`Stock`型を定義します。
 
 ```swift
 struct Stock {
 }
 ```

 この`Stock`型に、2つのプロパティを実装しましょう。
 まず、「銘柄の会社名」を示すプロパティとして、`String`型の定数`companyName`を宣言します。
 さらに、「現在の株価」を示すプロパティとして、`Double`型の変数`currentPrice`を宣言します。
 
 ```swift
 struct Stock {
     let companyName: String
     var currentPrice: Double
 }
 ```

 `Stock`型を定義できましたが、そのプロパティはいずれも既定値が未設定です。
 \
 \
 それでは、イニシャライザを呼び出して「`Stcok`型のインスタンス」を作成しましょう。
 構造体にひとつでも「既定値がないプロパティ」がある場合、自動的に**メンバーワイズイニシャライザ**が提供されます。
 メンバーワイズイニシャライザのパラメータリストには、その型のプロパティが定義順に列挙されます。

 次のコードは、`Stock`型のメンバーワイズイニシャライザを呼び出して、「Apple社の株式」を示すインスタンスを作成します。
 
 ```swift
 var appleStock = Stock(companyName: "Apple", currentPrice: 138.88)
 ```

 ここでは、作成したインスタンスを変数にしている点に注目してください。
 \
 \
 インスタンスを作成するにあたって、「型に定義されたすべてのプロパティ」に既定値を設定することを**初期化**といいます。
 メンバーワイズイニシャライザは「既定値が設定されていないプロパティ」をすべて列挙するので、正しく初期化を完了できます。
 なお、メンバーワイズイニシャライザが提供される場合は、標準イニシャライザは呼び出せません。
 標準イニシャライザでは「すべてのプロパティに既定値が設定されるとは限らない」ので、インスタンスの初期化が正しく完了しない恐れがあるからです。
 \
 \
 さて、この「Appleの株式」を示す変数インスタンスを操作してみましょう。
 
 以下のコードでは、「現在の株価」を`139.99`に更新します。
 さらに、「銘柄の会社名」を`"Apple Computer"`に変更します。
 
 ```swift
 appleStock.currentPrice = 139.99
 appleStock.companyName = "Apple Computer"   // error: Cannot assign to property: 'companyName' is a 'let' constant
 ```

 実行すると、「現在の株価」は更新できますが、「銘柄の会社名」は変更できません。
 `Stock`型の定義において、`companyName`プロパティは定数として宣言されたからです。
 「銘柄の会社名」を後から変更できない定数プロパティにすることは妥当でしょう。
 「command + /キー」を押して、エラーのコードはコメントアウトします。
 \
 \
 今度は、インスタンスを定数として作成してみましょう。
 
 次のコードは、「Microsoft社の株式」を示す定数インスタンスを作成します。

 ```swift
 let microsoftStock = Stock(companyName: "Microsoft", currentPrice: 214.25)
 ```
 
 定数に保持された構造体インスタンスは、 そのプロパティが変数であっても値を変更できません。
 \
 \
 次のコードは、「Microsoft社の株式」の「現在の株価」を`215.25`ポイントに変更しようとします。
 ただし、これは不正なコードなので、コンパイラはエラーを報告します。
 
 ```swift
 microsoftStock.currentPrice = 215.25    // error: Cannot assign to property: 'microsoftStock' is a 'let' constant
 ```

 データの改変を禁止する場合以外、構造体のインスタンスは変数にしましょう。
 その上で、定数プロパティと変数プロパティを使い分けることで、道理に適ったプログラムを構築します。
 */
struct Stock {
    let companyName: String
    var currentPrice: Double
}

var appleStock = Stock(companyName: "Apple", currentPrice: 138.88)
appleStock.currentPrice = 139.99
//appleStock.companyName = "Apple Computer"

let microsoftStock = Stock(companyName: "Microsoft", currentPrice: 214.25)
//microsoftStock.currentPrice = 215.25
