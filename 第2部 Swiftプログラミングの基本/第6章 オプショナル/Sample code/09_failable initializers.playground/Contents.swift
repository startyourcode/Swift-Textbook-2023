/*:
 # failable initiaizers
 __`失敗があるイニシャライザ`__
 \
 \
 関数から意図的に`nil`を返すと、その手続きが失敗したことを表現できます。
 この手法をイニシャライザに適用すると、特定のデータ型がそのインスタンスを作成できなかったことを表現できます。
 このようなイニシャライザを特に「失敗があるイニシャライザ」といいます。
 \
 \
 Swift標準ライブラリの基本的なデータ型にも、「失敗があるイニシャライザ」は定義されています。
 
 例えば、次のコードは整数インスタンスを作成する`Int`型のイニシャライザです。
 
 ```swift
 Int("123")   // 123
 ```
 
 このイニシャライザは文字列リテラルを元にして、整数インスタンスを作成できます。
 \
 \
 ただし、文字列リテラルの内容次第では、整数インスタンスの作成に失敗します。

 ```swift
 Int("One Two Three")   // nil
 ```
 
 インスタンス作成に失敗すると、このイニシャライザは`nil`を返します。
 つまり、このイニシャライザは必ずしもインスタンス作成に成功するとは限らない、「失敗があるイニシャライザ」です。
 \
 \
 「失敗があるイニシャライザ」も、インスタンス作成に成功することがあります。
 ただし、「失敗があるイニシャライザ」によって作成されたインスタンスは、常にオプショナルでラップされます。
 
 ```swift
 let number = Int("12345")
 print(number)  // Prints Optional(12345)
 ```
 
 そのため、慎重にアンラップして扱う必要があります。
 
 ```swift
 let number = Int("12345")
 print(number ?? "Initialization failed...")  // Prints 12345
 ```

 ここでは、Nil結合演算子を利用してアンラップしました。
 \
 \
 実際に独自の構造体を定義して、そこに「失敗できるイニシャライザ」を実装してみましょう。

 以下に定義する`Rectangle`型は長方形をモデル化した構造体です。
 2つの定数プロパティは、それぞれ「横幅」と「高さ」を示しています。
 
 ```swift
 struct Rectangle {
     let width: Int
     let height: Int
 }
 ```
 
 この`Rectangle`型は、すべてのプロパティに既定値が設定されていません。
 したがって、メンバーワイズイニシャライザが自動的に提供されます。
 
 ```
 let smallRectange = Rectangle(width: 1, height: 2)
 ```
 
 メンバーワイズイニシャライザを呼び出して、「横幅`1`で高さが`2`」の小さな四角形インスタンスを作成しました。
 \
 \
 このイニシャライザは、どんな整数を渡してもインスタンスを作成できます。
 しかしながら、横幅や高さに「負の値」を指定して長方形インスタンスを作成することはナンセンスです。
 
 イニシャライザを上書きして、横幅と高さのいずれかがゼロ以下の四角形インスタンスは作らせないようにしましょう。
 
 以下のように実装した`init(width:height:)`メソッドは、メンバーワイズイニシャライザと同じ初期化を行います。
 
 ```swift
 struct Rectangle {
     let width: Int
     let height: Int
         
     init(width: Int, height: Int) {
         self.width = width
         self.height = height
     }
 }
 ```
 
 ここでは、パラメータとして受け取った値をプロパティにそのまま設定しています。
 \
 \
 イニシャライザにインスタンス作成を失敗させるには、`init`の直後に疑問符`?`を追記します。
 そして、returnステートメントで`nil`を返します。
  
 ```swift
 struct Rectangle {
     let width: Int
     let height: Int
         
     // ? is meaning failable initializer.
     init?(width: Int, height: Int) {
         if width <= 0 || height <= 0 {
             return nil
         }
         self.width = width
         self.height = height
     }
 }
 ```
 
 ここでは、横幅と高さのいずれか一方でも「負の値」だった場合に、`nil`を返しています。
 \
 \
 通常の`init()`メソッドは、その実装にreturnステートメントがありません。
 つまり、普通のイニシャライザは「何も値を返さない」ことを意味します。
 イニシャライザが行うべき本来の役割は初期化であり、それは「自身のインスタンスが持つプロパティに初期値を設定する」ことです。
 */
let number = Int("12345")
print(number ?? "Initialzation failed...")

struct Rectangle {
    let width: Int
    let height: Int
        
    init?(width: Int, height: Int) {
        if width <= 0 || height <= 0 {
            return nil
        }
        self.width = width
        self.height = height
    }
}

let smallRectange = Rectangle(width: 1, height: 2)

