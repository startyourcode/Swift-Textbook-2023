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
_03\_raw values.playground_

列挙型の定義する際、ケースに既定値を設定できます。
この既定値を列挙ケースの**実体値**といいます。
列挙型の実体値には「文字列、整数、小数点数、真偽値」のいずれかを設定できます。
ただし、ひとつの列挙型に設定する実体値は「すべて同じ型にする」必要があります。

以下に定義する`Signal`型は、道路の信号機をモデル化する列挙型です。

```swift
enum Signal {
    case green
    case yellow
    case red
}
```

列挙型に実体値を設定するには、型アノテーションで「設定する既定値の型」を明示します。
ここでは、「実体値が文字列型である」ことを宣言します。
そして、ケースごとに「具体的な既定値」を設定します。

```swift
enum Signal: String {
    case green = "Start driving or keep driving."
    case yellow = "Light is about to turn red."
    case red = "Stop."
}
```

`Signal`型の実体値は「信号色がどんな意味か」を示す文字列です。
この実体値を取得するには、列挙ケース値の`rawValue`プロパティにアクセスします。

```swift
Signal.green.rawValue   // "Start driving or keep driving."
Signal.yellow.rawValue  // "Light is about to turn red."
Signal.red.rawValue     // "Stop"
```

列挙型の実体値は、型を定義する際に設定しておく値です。
後から実体値を更新することはできません。

## 3. 実体値を暗黙的に設定する
_04_implicit assigned raw values.playground_

列挙型に実体値を定義するとき、各ケースに対する実体値の設定を省略できる場合があります。
Swiftは設定が省略されたケースに対して、自動的に実体値を設定します。
例えば、実体値を`Int`型として明示した場合、各ケースの実体値は「直前のケースに`1`を加算した整数」になります。

以下に定義する`Direction`型は、東西南北の方位をモデル化する列挙型です。
`Int`型の実体値を明示していますが、先頭ケースにだけ`1`を設定しています。

```swift
enum Direction: Int {
    case north = 1, east, southern, west
}
```

すると、先頭以降のケースには自動的に実体値が設定されます。
自動的に設定された整数の実体値は`1`だけ加算されるので、`east`の実体値は`2`です。

```swift
Direction.east.rawValue     // 2
Direction.southern.rawValue // 3
Direction.west.rawValue     // 4
```

なお、`Int`型の実体値について、先頭ケースの設定も省略した場合は暗黙的に`0`が設定されます。

実体値を`String`型として明示した場合も、各ケースには自動的に実体値が設定されます。

```swift
enum BloodType: String {
   case A, B, O, AB
}

BloodType.A.rawValue    // "A"
BloodType.B.rawValue    // "B"
BloodType.O.rawValue    // "O"
BloodType.AB.rawValue   // "AB"
```

`BloodType`型の実態値には、「各ケースの名前」が暗黙的に設定されています。

## 4. 基本値による列挙値の初期化
_05\_initializing from a raw value.playground_

実体値がある列挙型は、その実体値を使って新しい列挙値を初期化できます。
実体値を使って新しい列挙値を初期化するには、`init(rawValue:)`イニシャライザを呼び出します。

以下に定義する`Direction`型は、東西南北の方位を示す列挙型です。
先頭ケースを`1`とした整数の実体値が設定されている点に注目してください。
つまり、自動的に設定される実体値は`4`までです。

```swift
enum Direction: Int {
    case north = 1, east, southern, west
}
```

下のコードは`init(rawValue:)`イニシャライザを呼び出して、`Direction`型インスタンスを初期化します。

```swift
Direction(rawValue: 4)  // west
Direction(rawValue: 5)  // nil
```

パラメータに`4`を指定したコードは、`west`の`Direction`型インスタンスを作成します。
ただし、「存在しない`5`番目の列挙ケース」で初期化しようとした2行目のコードは`nil`を返します。
これら2行のコードは、`init(rawValue:)`イニシャライザは失敗する可能性があることを示しています。
つまり、`init(rawValue:)`は失敗できるイニシャライザであり、これによって作成されたインスタンスは常に「オプショナルな列挙ケース値」です。

列挙型には「独自のイニシャライザ」を定義することもできます。
以下で定義している`init()`メソッドは、いわゆるデフォルトイニシャライザと同じ形式で呼び出せます。

```swift
enum Direction: Int {
    case north = 1, east, southern, west

    init() {
        self = Direction.north
    }    
}

let diractionNorth = Direction()    // north
```

構造体などのイニシャライザでは、メンバープロパティに既定値を設定して初期化手続きを完了します。
それとは異なり、列挙型の初期化手続きでは、`self`キーワードで参照した自身のインスタンスに「任意の列挙ケース値」を設定します。
なお、`init(rawValue:)?`メソッドを実装すれば、自動的に提供される「実体値を指定するイニシャライザ」も上書き定義できます。

## 列挙型のメソッド
_0\_enumeration methods.playground_

Swiftの列挙型はデータをモデル化する正当な手段のひとつであり、れっきとした型として扱えます。
これは、構造体などと同じようにメソッドを定義できることを意味します。

***

以下に定義する`Direction`型は東西南北の方位をモデル化する列挙型です。
`getOpposite()`メソッドは、自身のインスタンスが示す方位と反対方向を返します。

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

`getOpposite()`メソッドの実装では、反対方向を算出するために整数の実体値を利用しています。
その際、`self`キーワードを使って自身のインスタンスを参照している点に注目してください。
なお、通常のメソッドと同様に列挙型のメソッドもパラメータを受け取ることができます。

`mutating`キーワードを使えば、列挙型にも自己可変メソッドを定義できます。
例えば、以下に示す`turnRight()`メソッドは、自身のインスタンスが示す方位を90度だけ右に回転します。

```swift
enum Direction: Int {
    case north = 1, east, southern, west

    mutating func turnRight() {
        let newDirection = (self.rawValue - 1) % 5
        self = Direction(rawValue: newDirection)!
    }
}

var currentDirection = Direction.east
currentDirection.turnRight()
currentDirection        // southern
```

`turnRight()`メソッドは自身のインスタンスを更新するために、`self`に対して新しい列挙ケース値を設定しています。

***

`static`キーワードを使えば、列挙型に型メソッドを定義することもできます。


## 列挙型のプロパティ
_0\_enumeration properties.playground_

列挙型にはメソッドの他に、プロパティを定義できます。
ただし、定義できるのは計算プロパティだけです。
通常のプロパティやプロパティ・オブザーバは列挙型に定義できません。

***

列挙型の計算プロパティは、構造体などと同じように実装できます。

以下に定義する`Direction`型は東西南北の方位をモデル化する列挙型です。
変数`isHeadingNorth`は、自身のインスタンスが「北を向いているかどうか」を返す計算プロパティです。

```swift
enum Direction: Int {
    case north = 1, east, southern, west

    var isHeadingNorth: Bool {
        return self == .north
    }
}

var currentDirection = Direction.east
currentDirection.isHeadingNorth     // false
```

`isHeadingNorth`プロパティは「自身のインスタンスが列挙ケースの`notrh`と等しいかどうか」を評価した結果を返しています。

## 5.  列挙型の付属値
_05\_associated values.playground_

通常、列挙型のインスタンスは「定義されたケース値」です。
列挙型のインスタンスに「より具体的なデータ」を設定できると便利な場合があります。
列挙ケースに**付属値**を定義しておくと、より具体的な値を設定できます。

+++

例えば、図書館で本を探すときには図書検索システムを利用できますが、「本のタイトル」で検索すると同じ名前の本が複数見つかるかもしれません。
そのような場合、ISBNコードで検索すると目的の本だけを検索できます。
ISBNは図書識別のために設けられた13桁の国際規格コードです。
スヌーピーの連載70周年に刊行された「ピーナッツ全集」は全部で25巻あります。
11巻を探したい場合、題名の「ピーナッツ全集」で検索すると複数ヒットしてしまいます。
ただし、ISBNコードの「978-4-309-62911-7」を知っていれば、そのような問題は回避できます。

以下に定義する`BookData`型は、検索情報を2つのケースから選べるようにモデル化した列挙型です。

```swift
enum BookData {
    case title
    case isbn
}
```

この`BookData`型は「本の題名で検索するか、ISBNコードで検索するか」を選択できますが、それが実際にどんな情報かは指定できません。

列挙型に付属値を定義すると、「そのケースが具体的にどんな情報か」を付加的に保持できます。
列挙型に付属値を定義するには、ケースの後に括弧`()`をつけて「その情報が示すデータ型」を指定します。

```swift
enum BookData {
    case title(String)
    case isbn(Int, Int, Int, Int, Int)
}
```

列挙型の付属値はタプル形式で指定できます。
上の定義における`isbn`ケースでは、ISBNコードの付属値が「5組の整数で構成される」ことを表現しています。

ケースの付属値はタプル形式なので、ラベルを指定することもできます。
下の`isbn`ケースに指定した付属値は、ISBNの各整数が「記号、地域、出版社、題名、チェック係数」であることを示しています。

```swift
enum BookData {
    case title(String)
    case isbn(symbol: Int, region: Int, publisher: Int, title: Int, checkdigit: Int)
}
```

列挙型の付属値は、インスタンス初期化時に「そのケースがどんな情報か」を設定します。
変数インスタンスであれば、値を更新することもできます。

```swift
var bookInformation = Book
Data.title("The complete peanuts")
bookInformation = .isbn(symbol: 987, region: 4, publisher: 309, title: 62911, checkdigit: 7)
```

列挙型の付属値は、実体値とまったく異なる概念です。
付属値は列挙ケースごとに設定できる「具体的な情報」です。
変数の列挙型インスタンスに対しては付属値を後から更新できます。
対照的に、実体値は「列挙型を定義する際にあらかじめ設定しておく値」です。
そのため、作成した列挙型インスタンスが変数であっても、実体値は変更できません。

## 6.Switch分岐構文の基本
_06_switch statements.playground_

if条件分岐構文はコードの実行フローを制御することができます。
それとは別のフロー制御構文として、switchステートメントがあります。
switch分岐構文は、評価すべき値が「どのケースに該当するか」に基づいて、実行フローを制御します。

+++

以降、switch分岐構文の基本を解説するために、レストランの人気度を「星の数」で表すプログラムを例に挙げます。
例えば、最高度の人気を「三ツ星」で表す場合は、変数`numberOfStars`に`3`を設定できます。

```swift
var numberOfStars = 3
```

「人気度を表す星の数」を評価して、実行フローを制御するswitch分岐構文は以下のように記述できます。
このswitch分岐構文における評価値は変数`numberOfStars`です。
つまり、変数`numberOfStars`が用意されたケースのどれに該当するかを、上から順番に評価します。

```swift
switch numberOfStars {
case 1:
    print("⭐️")
case 2:
    print("⭐️⭐️")
case 3:
    print("⭐️⭐️⭐️")
}
```

このswitchステートメントは変数`numberOfStars`が`1`なら⭐️をひとつ、`2`なら⭐️をふたつ、`3`なら⭐️をみっつだけ出力するコードを実行します。
ただし、コンパイラは上のswitchステートメントに対して構文エラーを報告します。
このswitchステートメントは「評価値が`1`か`2`か`3`になるケース」しか考慮していないからです。

コンパイラはswitchステートメントに対して網羅性を要求します。
つまり、このエラーを解消するには、評価値が`1`から`3`以外のどんな整数になっても、ケースに該当するように考慮しなければいけません。
すべての整数に対応するために、ひとつずつケースを用意することは現実的ではありません。
用意したケースのいずれにも評価値が該当しなかった場合は、dafault節でカバーできます。

```swift
switch numberOfStars {
case 1:
    print("⭐️")
case 2:
    print("⭐️⭐️")
case 3:
    print("⭐️⭐️⭐️")
default:
    print("No rating...")
}
// Prints "⭐️⭐️⭐️"
```

上のswitchステートメントが示すように、default節は常にすべてのケースの最後に配置します。

+++

switchステートメントを利用する利点は、コンパイラによって分岐の網羅性が検査されることです。
ifステートメントにはないこの仕組みのおかげで、より堅牢なプログラムを構築できます。

## 列挙ケースを評価するSwitchステートメント
_\_.playground_

```swift
enum Rating {
    case good, better, exellent
}
var stars: Rating = .good
```

```swift
switch stars {
case .good:
    print("⭐️")
case .better:
    print("⭐️⭐️")
case .exellent:
    print("⭐️⭐️⭐️")
}
```

## 列挙ケースの実体値を抽出するSwitchステートメント

```swift
enum BookData {
    case title(String)
    case isbn(Int, Int, Int, Int, Int)
}
var bookInformation = BookData.isbn(987, 4, 309, 62911, 7)
```

```swift
switch bookInformation {
case let .title(bookTitle):
    print("Title: \(bookTitle)")
case let .isbn(symbol, region, publisher, title, checkdigit):
    print("ISBN: \(symbol)-\(region)-\(publisher)-\(title)-\(checkdigit)")
}
```