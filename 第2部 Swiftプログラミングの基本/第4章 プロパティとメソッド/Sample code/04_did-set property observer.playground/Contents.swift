/*:
 # did-set property observer
 __`Did-Set プロパティ・オブザーバ`__
 \
 \
 プロパティ・オブザーバのwillSet節には、「更新直前に実行したいコード」を実装できました。
 それに対して、Did-Setオブザーバは、プロパティに「値が割り当てられた直後」に実行されます。
 Did-Setオブザーバを実装するには、`didSet`キーワードを使います。

 以下の例では、構造体の`Some`型を定義して、その変数プロパティにDid-Setオブザーバを実装します。
  
 ```swift
 struct Some {
     var observedProperty: String {
         didSet {
         }
     }
 }
 ```
 
 `didSet`節では「変更される以前の値」を`oldValue`という識別子で参照できます。
 この識別子は`willSet`節と同様に、「任意の定数名」を指定することもできます。
 そして、更新された後の値は「自身のインスタンス」を示す`self`から参照できます。
 
 ```swift
 struct Some {
     var observedProperty: String {
         didSet {
             print("\(oldValue) did change to \(self.observedProperty).")
         }
     }
 }
 ```

 なお、プロパティ・オブザーバには既定値を設定できます。
 また、プロパティ・オブザーバの実装において、「自身のインスタンス」を示す`self`キーワードは省略できます。

 ```swift
 struct Some {
     var observedProperty: String = "Afternoon" {
         didSet {
             print("\(oldValue) did change to \(observedProperty).")
         }
     }
 }
 ```

 それでは、プロパティの値が更新された直後に、Did-Setオブザーバが実行されることを確認しましょう。

 次のコードは、`didSet`オブザーバがあるプロパティの値を更新します。
 
 ```swift
 var something = Some()
 something.observedProperty = "Evening" // Prints Afternoon did change to Evening.
 ```

 なお、Will-Setオブザーバと同様に、プロパティに「更新前と同じ値」を割り当てた場合もDid-Setオブザーバは実行されます。
 \
 \
 プロパティ・オブザーバの`willSet`節と`didSet`節は、同時に実装することもできます。
 
 ```swift
 struct Some {
     var observedProperty: String = "Afternoon" {
         \\ add will-set observer.
         willSet {
             print("Now is \(observedProperty).")
             print("It will be \(newValue) soon.")
         }
         didSet {
             print("\(oldValue) did change to \(observedProperty).")
             print("Now is \(observedProperty).")
         }
     }
 }
 ```
 
 再度、先ほどのコードを実行してみましょう。
 プロパティ・オブザーバが「値の更新直前、直後のタイミング」で実行されいることが確認できます。
 
 ```swift
 var something = Some()
 something.observedProperty = "Evening"
 // Now is Afternoon.
 // It will be Evening soon.
 // Afternoon did change to Evening.
 // Now is Evening.
 ```
 */
struct Some {
    var observedProperty: String = "Afternoon" {
        willSet {
            print("Now is \(observedProperty).")
            print("It will be \(newValue) soon.")
        }
        didSet {
            print("\(oldValue) did change to \(observedProperty).")
            print("Now is \(observedProperty).")
        }
    }
}
var something = Some()
something.observedProperty = "Evening"
