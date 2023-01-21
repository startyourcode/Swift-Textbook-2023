/*:
 # locale variables
 __`ローカル変数`__
 \
 \
 全国にある鉄道のうち、ある地域だけに敷かれた鉄道網をローカル線と言ったりします。
 ローカル線を利用するには、その地域に行かなければいけません。
 
 プログラミングにおいても、ある場所でしか参照できない変数を**ローカル変数**と言います。
 \
 \
 例として、株価の値動きを追跡するプログラムを考えましょう。
 
 最初に、「現在の株価」を追跡するために、変数`currentPrice`を定義します。

 ```swift
 var currentPrice = 123.4
 ```

 このコードは、現時点での株価が`123.4`ポイントであることを示します。
 \
 \
 株価の更新は、以下に定義する`update(amount:)`関数を使って更新することにします。
 
 ```swft
 func update(amount: Double) {
     currentPrice += amount
     print("Updated to \(currentPrice).")
 }
 ```
 
 パラメータの`amount`は「株価の変化量」です。
 この`amount`を加算して、「現在の株価」を更新します。
 \
 \
 この関数に、「以前の株価」と比較できる機能を追加しましょう。

 関数の中に新しい定数`previousPrice`を定義して、更新される前の「現在の株価」を保持します。
 
 ```swift
 func update(amount: Double) {
     let previousPrice = currentPrice
     currentPrice += amount
     print("Updated from \(previousPrice) to \(currentPrice).")
 }
 ```

 `update(amount:)`関数を呼び出して、現在の株価を`1.5`ポイント値上げしましょう。

 ```
 update(amount: +1.5)   // Prints Updated from 123.4 to 124.9.
 ```
 
 実行すると、コンソールに「株価の変更内容」が出力されました。
 ちなみに、「値上げ方向に株価が更新された」ことを強調するために、`+`記号を明示しています。
 \
 \
 ここで、関数の外側から「以前の株価」を呼び出すことはできないことに注意してください。
 定数`previousPrice`を参照しようとすると、コンパイラはエラーを報告します。

 ```
 previousPrice  // error: Cannot find 'previousPrice' in scope
 ```

 定数`previousPrice`は関数の内部、つまり「ローカルな領域」で定義されました。
 そのため、スコープの外側である「グローバルな領域」から参照することは、禁止されます。
 \
 \
 識別子には、それを参照できるスコープの範囲があることに気をつけましょう。
 */
var currentPrice = 123.4

func update(amount: Double) {
    let previousPrice = currentPrice
    currentPrice += amount
    print("Updated from \(previousPrice) to \(currentPrice).")
}

update(amount: +1.5)
//previousPrice
