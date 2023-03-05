# 第9章 列挙型とSwitch分岐構文

あるデータについて、それがどのように変化できるかを予め制限しておくと便利な場合があります。
例えば、カフェで注文する飲み物サイズを示すデータについて、「S, M, L」のいずれかだけに設定できるようにすることは妥当です。
このようなデータは**列挙型**としてモデル化できます。
そして、列挙型を**Switch分岐構文**で利用すると、コードの安全性が向上します。
Switch分岐構文は、ifステートメントのように「どの実行するコードすべきか」を制御する仕組みです。

## 1. 列挙型の基本
_01_enumerations.playground_

列挙型の基本について、解説します。
そのために、カフェで注文する飲み物のサイズをモデル化する列挙型を例に挙げます。

列挙型を定義するには、`enum`キーワードを使います。

```swift
enum DrinkSize {
}
```

`DrinkSize`型は「飲み物のサイズ」をモデル化した列挙型です。
列挙型のボディでは、そのデータがとりうる値を`case`キーワードで記述します。

```swift
enum DrinkSize {
    case small
    case regular
    case large
}
```

上に定義した`DrinkSize`型は、その値が「小・中・大」を示す3種類のケースから選べることを意味します。
このような単純な列挙型では、それぞれのケースをひとつにまとめて以下のように記述することもできます。

```swift
enum DrinkSize {
    case small, regular, large
}
```

飲み物のサイズをモデル化した列挙型の`DrinkSize`型を定義できました。

列挙型の値を利用にあたって、イニシャライザは不要です。
例えば、「飲み物のサイズ」を示す列挙型インスタンスは以下のようにして作成できます。

```swift
var appleJuiceSize = DrinkSize.small
var bananaAulaitSize: DrinkSize = .regular
```

上のコードで定義しているふたつの変数はどちらも`DrinkSize`型インスタンスですが、ここでは変数`bananaAuleitSize`の宣言に注目してください。
変数`bananaAulaitSize`は型アノテーションによって「`DrinkSize`型である」ことが明示されています。
その場合、代入演算子`=`の右辺では「ドット以前の型名」を省略できます。

列挙型インスタンスを呼び出すと、その値に設定されている列挙型の**ケース値**を取得できます。

```swift
appleJuiceSize      // small
bananaAulaitSize    // regular
```

ここで、`DrinkSize`型の列挙型インスタンスを呼び出して取得した値は、文字列のようなデータではない点に注意してください。
基本的に、列挙ケースの値は大小関係があるものではなく、あくまでも各ケース値を区別するだけです。

前述の通り、代入先の変数および定数について「列挙型である」ことが自明な場合、右辺の型名を省略できます。

```swift
appleJuiceSize = .large 
bananaAulaitSize = .large
```

上のコードについて、コンパイラは「変数`appleJuiceSize`と`bananaAulaitSize`が`DrinkSize`型である」ことを知っています。
したがって、値を更新する際にはケース値の型名を省略できます。

## 2. 列挙型の実体値
_03_raw values.playground_

列挙型の定義では、ケースに既定値を設定できます。
この既定値を列挙ケースの**実体値**といいます。
基本値には「文字列、整数、小数点数、真偽値のいずれかの値」を設定できます。
ただし、ひとつの列挙型に設定する実体値は「すべて同じ型にする」必要があります。

+++

以下に定義する`Signal`型は、道路の信号機をモデル化する列挙型です。

```swift
enum Signal {
    case green
    case yellow
    case red
}
```

列挙型に実体値を設定するには、型アノテーションで「設定する既定値の型」を宣言します。
ここでは、「実体値が文字列型である」ことを宣言します。
そして、ケースごとに「具体的な既定値」を設定します。

```swift
enum Signal: String {
    case green = "Start driving or keep driving."
    case yellow = "Light is about to turn red."
    case red = "Stop."
}
```

上の`Signal`型において、各ケースの実体値は「それぞれの信号色の意味」を示す文字列です。

実体値を取得するには、その列挙値の`rawValue`プロパティにアクセスします。

```swift
Signal.green.rawValue   // "Start driving or keep driving."
Signal.yellow.rawValue  // "Light is about to turn red."
Signal.red.rawValue     // "Stop"
```

実体値は、列挙型を定義する際に「あらかじめ設定しておく値」です。
つまり、後から列挙ケースの実体値を更新することはできません。

## 3. 実体値を暗黙的に設定する
_04_implicit assigned raw values.playground_

列挙型で実体値に定義をするとき、各ケースに対する実体値の設定を省略できる場合があります。
Swiftは、記述が省略されたケースに自動的に実体値を設定します。

例えば、実体値に整数を設定する場合、各ケースの値は「直前のケースに`1`を加算した整数」になります。
基本値の型を整数として宣言して、先頭ケースにだけ`1`を設定します。

```swift
enum Direction: Int {
    case north = 1, east, southern, west
}
```

すると、先頭以降のケースには、自動的に実体値が設定されます。
自動的に設定された実体値は`1`だけ加算されるので、`east`の実体値は`2`です。

```swift
Direction.east.rawValue     // 2
Direction.southern.rawValue // 3
Direction.west.rawValue     // 4
```

なお、先頭ケースに対する実体値の設定も省略した場合、自動的に`0`が設定されます。

実体値の型を文字列として宣言した場合、暗黙的に「各ケースの名前」が実体値として設定されます。

```swift
enum BloodType: String {
   case A, B, O, AB
}

BloodType.A.rawValue    // "A"
BloodType.B.rawValue    // "B"
BloodType.O.rawValue    // "O"
BloodType.AB.rawValue   // "AB"
```

## 4. 基本値による列挙値の初期化
_05_initializing from a raw value.playground_

実体値がある列挙型は、その実体値を使って新しい列挙値を初期化できます。
実体値を使って新しい列挙値を初期化するには、「実体値と同じ型の値」を受け取るイニシャライザを呼び出します。

この列挙型には、先頭を`1`とした整数の実体値を設定しておきます。

```swift
enum Direction: Int {
    case north = 1, east, southern, west
}
```

自動的に設定される実体値は`4`までしかない点に注目してください。
ここでは、パラメータの実体値に`5`を指定して初期化します。

```swift
Direction(rawValue: 4)  // west
Direction(rawValue: 5)  // nil
```

このコードは「存在しない5番目の列挙ケース」を初期化しようとするので、失敗して`nil`を返します。

「定義されていない実体値」の列挙型インスタンスを初期化しようとすると、イニシャライザは失敗します。
これは、「実体値と同じ型の値」を受け取るイニシャライザは常に、失敗する可能性があることを意味しています。
言い換えると、「実体値と同じ型の値」を受け取るイニシャライザは「オプショナルな列挙値」を返すということです。
つまり、`nil`を返すかもしれない「失敗できるイニシャライザ」です。
実体値を指定して初期化した列挙型インスタンスはオプショナルでラップされる点に注意してください。

独自のイニシャライザも定義できる

```swift
enum Direction: Int {
    case north = 1, east, southern, west

    init() {
        self = Direction.north
    }    
}

let diractionNorth = Direction()    // north
```

通常、構造体などのイニシャライザは、メンバープロパティに既定値を設定して初期化手続きを完了する
列挙型の初期化手続きでは、`self`キーワードを使って自身のインスタンスを参照、そこに作成したインスタンスを設定

なお、`init(rawValue:)?`メソッドを実装すれば、自動的に提供される「実体値を指定するイニシャライザ」も上書き定義できます。

## 列挙型のメソッド

列挙型はデータをモデル化する正当な手段のひとつであり、れっきとした型として扱える
構造体などと同じように、メソッドを定義できることを意味する
これにはパラメータを受け取るメソッド、値を返すメソッド、自己可変メソッドを含む
さらに、`static`キーワードを使えば、型メソッドも実装できる

```swift
enum Direction: Int {
    case north = 1, east, southern, west

    func getOpposite() -> Direction {
        let zeroToThree =  (self.rawValue + 2) % 5
        return Direction(rawValue: zeroToThree)!
    }
}

var currentDirection = Direction.east
currentDirection.getOpposite()  // west
```


```swift
enum Direction: Int {
    case north = 1, east, southern, west

    mutating func turnRight() {
        let newDirection = (self.rawValue - 1) % 5
        self = Direction(rawValue: newDirection)!
    }
}

var currentDirection = Direction.east
currentDirection.turnRight()    // southern
```


## 列挙型のプロパティ

列挙型に定義できるのは、計算プロパティだけ
通常のプロパティやプロパティ・オブザーバは列挙型に定義できない

```swift
enum Direction: Int {
    case north = 1, east, southern, west

    var isHeadingNorth: Bool {
        return self == .north ? true : false
    }
}

var currentDirection = Direction.east
currentDirection.isHeadingNorth
```


## 5.  列挙型の付属値
_02_associated values.playground_

通常、列挙型の値とは「そこに定義されたケース自体」のことです。
列挙型の値に、列挙ケースではない「具体的なデータ型の値」を設定できると便利な場合があります。
列挙ケースに**付属値**を定義しておくと、より具体的な値を設定できるようになります。

以降の例では、連絡先をメールアドレスと電話番号の2つの形式で追跡するプログラムを考えます。

下に定義する`Contact`型は、2つのケースがある列挙型です。
ケースはそれぞれ、メールアドレスと電話番号を示します。

```swift
enum Contact {
    case email
    case phone
}
```

`Contact`型のケース値は「メールアドレス」と「電話番号」のどちらかを選択するだけです。
つまり、具体的なメールアドレスや電話番号は保持できないということです。
しかしながら、列挙型に付属値を定義することで、その具体的な値も付加的に保持できるようになります。

列挙型に付属値を定義するには、ケースの後に括弧`()`をつけて「具体的な値の型」を指定します。

```swift
enum Contact {
    case email(String)
    case phone(Int, Int, Int)
}
```

上のように定義した`Contact`型の付属値は、メールアドレスが文字列で、電話番号は3つの整数で構成されることを意味しています。

```swift
let friendContact = Contact.email("hello@iCloud.com")
let myPrivatePhone: Contact = 
print(friendContact)
```



```swift
friendContact = .phone(090, 1234, 5678)
print(friendContact)
```


列挙型の実体値と付属値はまったく異なる概念です。
実体値とは「列挙型を定義する際にあらかじめ値を設定しておく」ものです。
つまり、列挙型の実体値は変更できません。
対照的に、付属値は列挙ケースに基づいて「定数や変数を新たに作成するときに割り当てる値」です。
付属値は定数や変数を作成した後も、型が適切であれば何度でも値を更新できます。


```swift
// 書籍の在庫追跡システム
// 国際標準図書番号（International Standard Book Number）は「どこの国の、何という名称の出版者が発行する、何という書名の書籍か」を識別する
// prefix-country-publisher-symbol-check digit
// 123-4-567-89012-3
// 978-4-309-47450-0（原題; 21 Lessons）

enum Book {
    case title(String)
    case isbn(symbol: Int, region: Int, publisher: Int, title: Int, checkdigit: Int)
}

var bookInfomation = Book.title("A Brief History of Humankind")
print(bookInfomation)   // Prints title("A Brief History of Humankind")

bookInfomation = .isbn(symbol: 987, region: 4, publisher: 309, title: 46745, checkdigit: 0)
```

## 6.Switch分岐構文の基本
_06_switch statements.playground_

注文された飲み物のサイズに基づいて、出力するメッセージを制御するプログラム
評価値と一致するケース節の手続きが実行される
それ以外の結果は、default節で対応する
breakキーワードを使えば、何もしないでswitchステートメントを修了できる

```swift
var orderedDrinkSize = "M"
switch orderedDrinkSize {
case "S":
    print("A small drink was ordered.")
case "M":
    print("A medium drink was ordered.")
case "L":
    print("A large drink was ordered.")
default:
    break
}
```

strawberryの規格
Sサイズ:  6g~10g
Mサイズ:  10~15g
Lサイズ:  15~20g
2Lサイズ: 20~28g
3Lサイズ: 28~37g
デラックス: 37g〜

```swift
var spec = "out of spec"   // before evaluation
var wightOfstrawberry = 10  // grams
switch wightOfstrawberry {
case let weight where weight <= 6:
    spec = "S"
default:
    spec = "Deluxe"
}
print("The strawberry is \(spec) size.")
```
