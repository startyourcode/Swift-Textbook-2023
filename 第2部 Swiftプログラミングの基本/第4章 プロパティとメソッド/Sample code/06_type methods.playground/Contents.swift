/*:
 # type methods
 __`型メソッド`__
 \
 \
 通常のメソッドは、インスタンスから呼び出す**インスタンスメソッド**です。
 これに対して、型自体から呼び出すメソッドを**型メソッド**といいます。
 Swift以外のプログラミング言語では、静的メソッド（*static methods*）として知られていることもあります。
 インスタンスメソッドと同じように、型メソッドもドットシンタックスで呼び出せます。
 \
 \
 標準ライブラリの`Int`型や`Double`型にも、型メソッドが定義されています。
 
 次のコードは、`Int`型と`Double`型の型メソッドである`random(in:)`メソッドを呼び出します。

 ```swift
 Int.random(in: 1...3)
 Double.random(in: 0...1)
 ```

 `random(in:)`メソッドは実行するたびに「指定した範囲内の乱数」を返します。
 このコードを何度か実行すると、指定した範囲内の数値をランダムに取得できます。
 \
 \
 それでは、実際に「独自の型メソッド」を定義してみましょう。
 ここでは、以下に定義する構造体の`Some`型を例に挙げます。
 
 ```swift
 struct Some {
 }
 ```

 型メソッドを定義するには、通常のメソッド宣言を`static`キーワードでマークします。
 
 ```swift
 struct Some {
     static func typeMethod() {
         print("Type method is executed!")
     }
 }
 ```

 インスタンスメソッドと同様に、型メソッドもパラメータを受け取ったり、値を返すことができます。
 
 例として、先ほどの型メソッドに整数パラメータとして`number`を宣言します。
 
 ```swift
 struct Some {
     // Add number parameter to type method.
     static func typeMethod(_ number: Int) {
         print("Type method is executed!")
         print("Type method received \(number).")
     }
 }
 ```

 型メソッドのボディでは、受け取った整数パラメータの`number`を参照しています。
 \
 \
 型メソッドのスコープは、その型を定義しているボディ全体です。
 型メソッドの実装において`self`キーワードを使用すると、インスタンスではなく、その型自体を参照できます。
 
 例として、`Some`型に型プロパティの定数`number`を定義します。
 ここで、「型プロパティの名前」と「型メソッドのパラメータ名」が重複していることに注目してください。

 ```swift
 struct Some {
     static let number = 123    // Add new type property
    
     static func typeMethod(_ number: Int) {
         print("Type method is executed!")
         print("Type method received \(number).")
     }
 }
 ```
 
 型メソッドの実装において`self`を参照すると、この`number`型プロパティを取得できます。

 ```swift
 struct Some {
     static let number = 123
         
     static func typeMethod(_ number: Int) {
         print("Type method is executed!")
         print("Type method received \(number).")
         print("The value of the type property is \(self.number).")
     }
 }
 ```
 
 本来、この`self`キーワードは省略できます。
 ただし、この例における`self`を省略すると、`number`は「型メソッドのパラメータ名」への参照が優先されてしまいます。
 \
 \
 実際にこの型メソッドを呼び出してみましょう。
 
 ```swift
 Some.typeMethod(456)
 // Type method is executed!
 // Type method received 456.
 // The value of the type property is 123.
 ```

 型メソッドの実装で`self`を使用したことで、「型プロパティの`number`」と「パラメータの`number`」を明確に区別できました。
 \
 \
 今度は、型メソッドの実装で「他の型メソッド」を呼び出してみましょう。
 
 例として、新たに「別の型メソッド」を定義します。
 
 ```swift
 struct Some {
     static let number = 123
         
     static func typeMethod(_ number: Int) {
         print("Type method is executed!")
         print("Type method received \(number).")
         print("The value of the type property is \(self.number).")
     }
 
     // Add new type method
     static func anotherTypeMethod() {
         print("Another type method is executed!")
     }
 }
 ```

 型メソッドから「別の型メソッド」を呼び出します。
 この場合も`self`キーワードを省略できます。
 また、ドットシンタックスを介して型名を明示する必要もありません。
 
 ```swift
 struct Some {
     static let number = 123
         
     static func typeMethod(_ number: Int) {
         print("Type method is executed!")
         print("Type method received \(number).")
         print("The value of the type property is \(self.number).")
         anotherTypeMethod()    // Call another type method
     }
 
     static func anotherTypeMethod() {
         print("Another type method is executed!")
     }
 }
 ```

 型メソッドの実装においては、インスタンスプロパティを参照したり、インスタンスメソッドを呼び出すことはできません。
 型メソッドが呼び出される時点で、常に「インスタンスが初期化されている」とは限らないからです。
 */
Int.random(in: 1...3)
Double.random(in: 0...1)

struct Some {
    static let number = 123

    static func typeMethod(_ number: Int) {
        print("Type method is executed!")
        print("Type method received \(number).")
        print("The value of the type property is \(self.number).")
        anotherTypeMethod()
    }
    
    static func anotherTypeMethod() {
        print("Another type method is executed!")
    }
}
Some.typeMethod(456)
