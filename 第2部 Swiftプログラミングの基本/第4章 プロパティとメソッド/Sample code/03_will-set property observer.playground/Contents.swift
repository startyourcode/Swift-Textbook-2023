/*:
 # will-set property observer
 __`Will-Set プロパティ・オブザーバ`__
 \
 \
 **プロパティ・オブザーバ**を利用すると、「プロパティ値の変化」を監視して応答できます。
 プロパティ・オブザーバの`willSet`節に実装したコードは、そのプロパティに値が割り当てられる直前に実行されます。

 以降の例では、プロパティの「Will-Setオブザーバがどのように動作するか」を確認するために、構造体の`Some`型を定義します。

 ```swift
 struct Some {
     var observedProperty: String
 }
 ```
 
 プロパティにWill-Setオブザーバを実装するには、`willSet`キーワードを使います。

 ```swift
 struct Some {
     var observedProperty: String {
         willSet {
         }
     }
 }
 ```
 
 Will-Setオブザーバでは、「プロパティに設定される新しい値」を定数`newValue`で参照できます。
 
 ```swift
 struct Some {
     var observedProperty: String {
         willSet {
             print("It will be \(newValue) soon.")
         }
     }
 }
 ```

 なお、この定数`newValue`には、独自に「任意の名前」を指定することもできます。
 ここでは、「1日の時間帯」を意味する識別子として、`partOfDay`を明示します。

 ```swift
 struct Some {
     var observedProperty: String {
         willSet(partOfDay) {
             print("It will be \(partOfDay) soon.")
         }
     }
 }
 ```

 変数`observedProperty`に「新しい値」が割り当てられると、Will-Setオブザーバが呼び出されます。
 
 ```swift
 var something = Some(observedProperrty: "Morning")
 something.observedProperty = "Afternoon"    // Now is Morning. It will be Afternoon soon.
 ```

 `willSet`節のコードは「新しい値」が割り当てられる直前に実行されています。
 その証拠に、`willSet`節で「自身のプロパティ値」を参照すると、更新前の値が参照できます。
 
 ```swift
 struct Some {
     var observedProperty: String {
         willSet(partOfDay) {
             print("Now is \(self.observedProperty).")  // Refer to self own property.
             print("It will be \(partOfDay) soon.")
         }
     }
 }
 ```

 再度、先ほどのコードを実行すると、更新前の値である`"Morning"`を取得できていることが確認できます。
 また、変数`obervedProperty`の値の更新も完了していることが確認できます。
 
 ```swift
 var something = Some(observedProperrty: "Morning")
 something.observedProperty = "Afternoon"    // Now is Morning. It will be Afternoon soon.
 something.observedProperty                  // Afternoon
 ```
  
 ちなみに、Will-Setオブザーバは、そのプロパティを「既存の値」と同じ値で更新した場合も呼び出されます。
 また、「オブザーバがあるプロパティ」をin-outパラメータとして関数に渡すと、値の書き換えが発生するのでプロパティ・オブザーバが呼び出されます。
 */
struct Some {
    var observedProperty: String {
        willSet {
            print("Now is \(self.observedProperty).")
            print("It will be \(newValue) soon.")
        }
    }
    
}

var something = Some(observedProperty: "Morning")
something.observedProperty = "Afternoon"
something.observedProperty
