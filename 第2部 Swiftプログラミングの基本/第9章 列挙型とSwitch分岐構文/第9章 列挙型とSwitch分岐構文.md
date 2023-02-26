# 第9章 列挙型とSwitch分岐構文

あるデータについて、それが変化できる値を予め制限しておくと便利な場合があります。
例えば、カフェで注文する飲み物サイズを「S, M, L」のいずれかだけに設定できるようにすることは妥当です。
このようなデータは**列挙型**としてモデル化できます。
そして、列挙型を**Switch分岐構文**で利用すると、コードの安全性が向上します。
Switch分岐構文は、ifステートメントのように「どの実行するコードすべきか」を制御する仕組みです。

## 1. 列挙型の基本
_01_enumerations.playground_

以降の例では、カフェで注文する「飲み物のサイズ」をモデル化するために、列挙型を定義します。
列挙型を定義するには、`enum`キーワードを使います。

```swift
enum DrinkSize {
}
```

`DrinkSize`型は「飲み物のサイズ」をモデル化した列挙型です。
列挙型のボディでは、そのデータがとりうる値を`case`節に記述します。

```swift
enum DrinkSize {
    case small
    case regular
    case large
}
```

このように定義した`DrinkSize`型は、その値が「小・中・大」を示す3種類のケースから選べることを意味します。
単純な列挙型では、それぞれの`case`節にまとめて以下のように記述することもできます。

```swift
enum DrinkSize {
    case small, regular, large
}
```

以上で、列挙型の`DrinkSize`型を定義できました。
列挙型の値を利用にあたって、イニシャライザは不要です。

例えば、「飲み物の小さいサイズ」を示す列挙型インスタンスは、以下のようにして作成できます。

```swift
var appleJuiceSize = DrinkSize.small
var bananaAulaitSize: DrinkSize = .regular
```

上のコードで定義しているふたつの変数はどちらも`DrinkSize`型インスタンスですが、ここでは変数`bananaAuleitSize`の宣言に注目してください。
変数`bananaAulaitSize`は型アノテーションによって「`DrinkSize`型である」ことが明示されています。
したがって、代入演算子`=`の右辺で「ドット以前の型名」を省略できます。

列挙型インスタンスを呼び出すと、その値に設定されている列挙型のケース値を取得できます。

```swift
appleJuiceSize      // small
bananaAulaitSize    // regular
```

前述の通り、代入先の変数および定数について「列挙型である」ことが自明な場合、右辺の型名を省略できます。
したがって、これらの変数を定義した以降の行では、コンパイラは「それらの変数が`DrinkSize`型である」ことを知っています。
そのため、値を更新する際には型名を省略して、ケース値だけを記述できます。

```swift
appleJuiceSize = .large 
bananaAulaitSize = .large
```

列挙型は、そのデータがとりうる値を「いくつかの列挙ケース」に制限できます。
この仕組みを利用することによって、より安全なSwiftプログラムの構築が可能になります。

## 2. 列挙型の基本値
_03_raw values.playground_

列挙型の定義では、ケースに既定値を設定できます。
この既定値を列挙ケースの**基本値**といいます。
基本値には「文字列、整数、小数点数、真偽値のいずれかの値」を設定できます。
ただし、ひとつの列挙型に設定する基本値は「すべて同じ型にする」必要があります。

+++

以下に定義する`Signal`型は、道路の信号機をモデル化する列挙型です。

```swift
enum Signal {
    case green
    case yellow
    case red
}
```

列挙型に基本値を設定するには、型アノテーションで「設定する既定値の型」を宣言します。
ここでは、「基本値が文字列型である」ことを宣言します。
そして、ケースごとに「具体的な既定値」を設定します。

```swift
enum Signal: String {
    case green = "Start driving or keep driving."
    case yellow = "Light is about to turn red."
    case red = "Stop."
}
```

上の`Signal`型において、各ケースの基本値は「それぞれの信号色の意味」を示す文字列です。

基本値を取得するには、その列挙値の`rawValue`プロパティにアクセスします。

```swift
Signal.green.rawValue   // "Start driving or keep driving."
Signal.yellow.rawValue  // "Light is about to turn red."
Signal.red.rawValue     // "Stop"
```

基本値を定数や変数に保持すると、その型が「列挙型ではなく、基本値の型」になっていることがわかります。

```swift
let meaningOfGreen = Signal.green.rawValue  // type of String.
let greenLight = Signal.green               // type of Signal.
```

基本値は、列挙型を定義する際に「あらかじめ設定しておく値」です。
つまり、後から列挙ケースの基本値を更新することはできません。

## 3. 基本値を暗黙的に設定する
_04_implicit assigned raw values.playground_

列挙型に基本値を使用するとき、各ケースの「基本値を設定する記述」を省略できる場合があります。
Swiftは、記述が省略されたケースに自動的に値を設定します。

例えば、基本値に整数を設定する場合、各ケースの値は「直前のケースに1を加算した整数」になります。
ここでは「週の曜日」を扱うプログラムを考えます。
日曜日から始まって、土曜日までの七日間を順番にケースとして列挙します。

```swift
enum Weekday {
   case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}
```

基本値の型を整数として宣言して、先頭ケースにだけ`1`を設定します。

```swift
enum Weekday: Int {
   case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
}
```

すると、先頭以降のケースには、自動的に基本値が設定されます。
自動的に設定された基本値は1だけ加算されるので、月曜日の基本値は`2`です。

```swift
Weekday.monday.rawValue    // 2
```

先頭ケースに対する基本値の設定が省略されている場合、自動的に0が設定されます。
「日曜日に設定した基本値」を省略してみましょう。

```swift
enum Weekday: Int {
   case sunday , monday, tuesday, wednesday, thursday, friday, saturday
}
```

すると、先頭ケースの日曜日が暗黙的に`0`になるので、月曜日の基本値は`1`に変化します。

```swift
Weekday.monday.rawValue    // 1
```

基本値の型を文字列として宣言した場合、暗黙的に「各ケースの名前」が基本値として設定されます。
血液型の列挙型は、ケース名自体を基本値として利用しても、問題なさそうです。

```swift
enum BloodType: String {
   case A
   case B
   case O
   case AB
}
```

`rawValue`プロパティにアクセスすると、文字列の基本値を取得できます。
 
```swift
BloodType.AB.rawValue  // "AB"
```

## 4. 基本値による列挙値の初期化
_05_initializing from a raw value.playground_

基本値がある列挙型は、その基本値を使って新しい列挙値を初期化できます。
基本値を使って新しい列挙値を初期化するには、「基本値と同じ型の値」を受け取るイニシャライザを呼び出します。

例として、1月から12月までの暦（こよみ）を扱うプログラムを考えます。

```swift
enum Month {
    case january, february, march, april, june, july, august, september, octber, november, december
}
```

この列挙型には、先頭を`1`とした整数の基本値を設定しておきます。

```swift
enum Month: Int {
    case january = 1, february, march, april, june, july, august, september, octber, november, december
}
```

自動的に設定される暦の基本値は`12`までしかない点に注目してください。
ここでは、パラメータの基本値に「13番目」を指定して初期化します。

```swift
Month(rawValue: 13)    // nil
```

このコードは「存在しない13番目の列挙ケース」を初期化しようとするので、失敗して`nil`を返します。

「定義されていない基本値」の列挙型インスタンスを初期化しようとすると、イニシャライザは失敗します。
これは、「基本値と同じ型の値」を受け取るイニシャライザは常に、失敗する可能性があることを意味しています。
言い換えると、「基本値と同じ型の値」を受け取るイニシャライザは「オプショナルな列挙値」を返すということです。
つまり、`nil`を返すかもしれない「失敗できるイニシャライザ」です。
このイニシャライザで初期化した値を使用する際は、オプショナル・バインディングで安全にアンラップする必要があります。

```swift
if let birthMonth = Month(rawValue: 6) {
    print("You are born in \(birthMonth).")
} else {
    print("Month can be any of 1-12.")
}
Prints You are born in june.
```

`1`から`12`までの基本値を指定した場合、具体的な列挙値を作成することができます。
したがって、`if`ステートメントのボディが実行されます。
万が一、存在しない基本値が指定された場合は、`else`節のコードが実行されます。



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


列挙型の基本値と付属値はまったく異なる概念です。
基本値とは「列挙型を定義する際にあらかじめ値を設定しておく」ものです。
つまり、列挙型の基本値は変更できません。
対照的に、付属値は列挙ケースに基づいて「定数や変数を新たに作成するときに割り当てる値」です。
付属値は定数や変数を作成した後も、型が適切であれば何度でも値を更新できます。


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
