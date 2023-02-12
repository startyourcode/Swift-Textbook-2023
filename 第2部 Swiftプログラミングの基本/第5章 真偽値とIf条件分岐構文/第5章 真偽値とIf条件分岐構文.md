# 第5章 真偽値とIf条件分岐構文

「空腹と満腹」「雨と晴れ」「有罪と無罪」などのように、ある事象に関して「相反する2つの状態」だけで表現することはとても画期的な発明でした。
さらに、そのいずれかの状態に基づいてコードを実行する仕組みは、プログラムに複雑なロジックを構築できるようにします。

## 1. 真偽値
_01_booleans.playground_

文字列、整数、少数点数の他に、Swiftの基本的なデータとして**真偽値**があります。
他のプログラミング言語では、**論理値**と呼ばれることもあります。

+++

Swiftの真偽値は`Bool`型として定義されています。
Swiftの真偽値リテラルは「`true`と`false`」のふたつだけです。

```swift
true
false
```

実際のプログラムにおいて、`Bool`値は頻繁に使用されます。

例えば、次のコードは「整数の`8`が指定した数で割り切れるかどうか」を調べます。
`isMultiple(of:)`メソッドは、その整数が「指定した値の倍数であるかどうか」を評価して、`Bool`値を返します。
 
```swift
let eight = 8
eight.isMultiple(of: 2) // true
eight.isMultiple(of: 3) // false
```

「`8`が`2`の倍数かどうか」を評価すると、結果は`true`です。
同様に、「`8`が`3`の倍数かどうか」を評価すると、結果は`false`です。

+++

プログラミング言語によっては、真偽値を`0`と`1`で代用できる場合があります。
Swiftは意図しない演算を防ぐために、真偽値は明確に`true`と`false`だけで表現します。

## 2. 比較演算子
_02_comparison operators.playground_

真偽値は2つのデータを比較する際に役立ちます。
データの比較とは「二つのデータが互いに等しいか」や「どちらのデータが大きいか」などを評価することです。
プログラミングではいくつかの**比較演算子**を利用することで、これを実行できます。
比較演算子は**関係演算子**としても知られています。

+++

「2つのデータが互いに等しいかどうか」を評価するには、等価演算子`==`を利用します。
等価演算子`==`は2つのデータが互いに等しい場合に限り、`true`を返します。

```swift
123 == 123          // true
"HELLO" == "hello"  // false
```

反対に、「データ同士が等しくないかどうか」を評価するためには不等価演算子`!=`を利用します。

```swift
123 != 123          // false
"HELLO" != "hello"  // true
```

「どちらのデータが大きいか」を評価するには、不等号演算子`>`および`<`を利用します。
どちらを使っても、同じ大きさのデータ同士を比較した結果は`false`です。

```swift
10 > 9      // true
10 > 10     // false
10 > 11     // false

10 < 9      // false
10 < 10     // false
10 < 11     // true
```

大小関係を判断する境界について、より詳しい条件も評価できます。
例えば、iPhoneはバッテリー残量が20パーセント以下になると、ユーザーに「充電切れが近い」ことを知らせてくれます。

次のコードは、「バッテリー残量を示す変数`battery`が`20`以下かどうか」を評価します。

```swift
var battery = 21
20 >= battery   // false; It's means battery is not low.
```

バッテリー残量が`20`になると、上と同じ評価式は`true`を返すようになります。

```swift
battery = 20
20 >= battery   // true; It's means battery is low.
```

これと同様に、比較対象が「ある大きさ以下であるかどうか」も評価できます。
例えば、iPhoneはバッテリー残量が80パーセント以上になると、電池の劣化を防ぐために自動的で高速充電を解除する機能があります。

```swift
battery = 80
80 <= battery   // true; Slow down battery charging speed.
```

いずれの場合も、同じ大きさのデータ同士を比較した結果が`ture`になることに注目してください。

+++

ここまで見てきたように、比較演算子はその左辺と右辺に一つずつデータを指定して、評価します。
そのような「2つのデータ」に対して利用される演算子を、特に**二項演算子**といいます。
注意すべき点として、Swiftの比較演算子は「互いのデータ型が異なる値の比較」には利用できません。

例えば、次のコードは「整数データと文字列データ」を比較しようとしています。

```swift
123 == "123"    // error; binary operator '==' cannot be applied to operands of type 'Int' and 'String'
```

左辺のデータは`Int`型ですが、右辺のデータは`String`型です。
このような、互いに異なるデータ型の値を比較するコードに対して、コンパイラはエラーを報告します。

## 3. If条件分岐構文
_03_if conditional statements.playground_

`true`と`false`の真偽値は、条件分岐コードを構築する際にその真価を発揮します。
条件分岐とは、「ある条件を満たすかどうか」を評価した結果に基づいて、実行すべきコードを制御する仕組みです。

+++

以降の例では、FizzBuzz問題のアルゴリズムを考えます。
アルゴリズムとは「特定の問題を解決するための手順や方法」です。
そして、FizzBuzz問題は「順番に数を数えていくゲーム」ですが、数える数が`3`の倍数なら「Fizz」、`5`の倍数なら「Buzz」、`3`と`5`の公倍数なら「FizzBuzz」と言うルールがあります。
FizzBuzz問題は、コンピュータアルゴリズムを学ぶ際に挙げられる有名な題材でもあります。
ここでは条件分岐プログラミングを学ぶために、任意の数が「`3`の倍数なら`"Fizz"`と出力する」ことにします。

任意の数が「`3`の倍数であるかどうか」は、その数を`3`で割り算した余りを`0`と比較して判断できます。
割り算の余りは剰余演算子`%`で取得できます。

```swift
let number = 12
number % 3 == 0    // ture
```

上のコードでは、「任意の数`number`が`3`で割り切れるかどうか」を評価しています。
実行した結果は`true`なので、「`3`の倍数である」と評価されたことを意味します。

この評価式の結果は、定数`isFizz`として保持しておきます。
コードが読みやすくするために、比較演算の部分に括弧`()`を付けておくことができます。

```swift
let isFizz = (number % 3 == 0) // true
```

それでは、この定数`isFizz`の値に基づいて、実行コードを制御する条件分岐ロジックを構築します。
ある条件を満たす場合に限り実行したいコードを記述するには、if条件分岐コードを利用できます。
`if`キーワードの直後には、`true`か`false`の真偽値を指定します。

```swift
if isFizz {
    // This code is executed when the condition is true.
}
```

コードブロックには、「条件を満たす場合に限り実行したいコード」を記述します。
定数`isFizz`が`true`だった場合には、`"Fizz"`と出力しましょう。

```swift
if isFizz {
    print("Fizz")
}
// Prints Fizz
```

このifステートメントを実行すると、コンソールに「`"Fizz"`」と出力されます。

## 4. Else節
_04_else clause.playground_

ifステートメントには条件を満たす場合に限り実行したいコードを記述できます。
ifステートメントにelse節を追加すると、条件を満たさなかった場合に実行したいコードを記述できます。

+++

例えば、次のコードは「定数`number`が`3`の倍数」である場合に限り、コンソールに`"Fizz"`を出力する条件分岐プログラムです。
整数インスタンスの`isMultiple(of:)`メソッドは、その整数が指定した数の倍数なら`true`を返します。
 
```swift
let number = 10

if number.isMultiple(of: 3) {
    print("Fizz")
}
// Prints nothing.
```

定数`number`が保持する`10`は、`3`の倍数ではありません。
したがって、このifステートメントを実行してもコンソールには何も出力されません。

条件を満たさなかった場合のコードを記述するためには、ifステートメントにelse節を追加します。
else節は常に、ifステートメントのいちばん最後に配置します。

定数`number`が`3`の倍数ではない（つまり、`isMultiple(of:)`メソッドが`false`を返した）場合は、整数をそのまま出力することにします。
 
```swift
if number.isMultiple(of: 3) {
    print("Fizz")
} else {
    print(number)
}
// Prints 10
```

再度、このifステートメントを実行すると、今度はコンソールに`10`が出力されます。

## 5. Else-If節
_05_else if clause.playground_

FizzBuzz問題は「数えた数が3の倍数ならFizzを、5の倍数ならBuzzを、3と5の公倍数ならFizzBuzzを出力する」アルゴリズムです。

+++

次のコードは「ある整数が`3`の倍数なら`Fizz`を出力し、そうでなければ整数を出力する」条件分岐プログラムです。

```swift
let number = 10

if number.isMultiple(of: 3) {
    print("Fizz")
} else {
    print(number)
}
// Prints 10
```

このifステートメントに「ある整数が`5`の倍数だったら`Buzz`を出力する」ための条件を追加しましょう。
このロジックは、「`3`の倍数ではなく、`5`の倍数だったら`"Buzz"`を出力する」ことを意味します。
したがって、上のifステートメントのelse節に「`5`の倍数だったら`"Buzz"`を出力する」ためのコードを実装できます。

```swift
let number = 10

if number.isMultiple(of: 3) {
    print("Fizz")
} else {
    if number.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(number)
    }
}
// Prints Buzz
```

`10`は`5`の倍数なので、このifステートメントを実行すると「`"Buzz"`」が出力されます。

入れ子構造（ネスト）になった条件分岐コードは、プログラムの読み手にストレスを与える原因です。
「それとも、別の条件」は、ifステートメントのelse-if節に追加できます。

次のコードは、先ほどのネストがあるifステートメントにelse-if節を追加して、再構築したバージョンです。

```swift
if number.isMultiple(of: 3) {
    print("Fizz")
} else if number.isMultiple(of: 5) {
    print("Buzz")
} else {
    print(number)
}
// Prints Buzz
```

分岐ロジックは変わっていないので、このifステートメントを実行しても「`"Buzz"`」が出力されます。

+++

else-if節はifステートメントにいくつでも追加できます。
ifステートメントに幾つかの条件があった場合、上から順に条件が評価されます。
そして、いずれかの条件がひとつでも満たされるとそれ以降の条件は評価されず、即座にifステートメントから脱出します。
また、else節がifステートメントのいちばん下にあることにも注目してください。
いずれの条件にも合致しなかった場合に実行されるelse節を追加する際は、常にifステートメントの最後に配置します。

## 6. 論理積算子
_06_logical AND operator.playground_

FizzBuzzアルゴリズムにおいて、「FizzBuzz」が出力される条件は「ある整数が`3`と`5`の公倍数である」場合です。
これはつまり、以下に挙げる二つの条件を同時に満たすことを意味します。
- ひとつは、ある整数が`3`の倍数であること。
- もうひとつは、ある整数が`5`の倍数であることです。
ふたつの条件が満たされる場合にコードを実行する条件分岐プログラムは、ifステートメントをネストして構築できます。
以下のネストしたifステートメントは「ある整数`number`が`3`の倍数であり、`5`の倍数でもある」場合、コンソールに`"FizzBuzz"`と出力します。
```swift
let number = 15
if number.isMultiple(of: 3) {
    if number.isMultiple(of: 5) {
        print("FizzBuzz")
    }
}
// Prints FizzBuzz
```
`15`は`3`と`5`の公倍数です。
つまり、「`3`の倍数かつ`5`の倍数」なので、このプログラムを実行すると「`"FizzBuzz"`」が出力されます。
しかしながら、ネストが深いコードは読みにくくなるので、このようなifステートメントの使い方は極力避けるべきです。
\
\
論理積演算子`&&`を使うことで、ネストしたifステートメントを簡潔に記述できます。
論理積とは、「ふたつの条件が両方とも`true`である場合に限り、式全体が`true`を返す」演算です。
例えば、整数`10`は`2`と`5`の公倍数なので、「`2`の倍数であること」と「`5`の倍数であること」を同時に満たします。
```swift
let ten = 10
ten.isMultiple(of: 2) && ten.isMultiple(of: 5)  // true
```
どちらか一方の条件でも満たされなかった場合、論理積演算の式は`false`を返します。
```swift
let ten = 10
ten.isMultiple(of: 2) && ten.isMultiple(of: 5)
ten.isMultiple(of: 2) && ten.isMultiple(of: 6)  // false
```
`10`は`2`の倍数ですが、`6`の倍数ではありません。
したがって、2つ目の論理積の演算式は`false`を返します。
\
\
論理積演算子`&&`を使用すると、先ほどのネストしたifステートメントは以下のように記述を改善できます。
```swift
if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
    print("FizzBuzz")
}
// Prints FizzBuzz
```
実行した結果に変わりはありませんが、ネストが解消されて読みやすいコードになりました。
\
\
このifステートメントに「`3`の倍数である場合」と「`5`の倍数である場合」および「それら以外の場合」の分岐を追加しましょう。
そうすることで、FizzBuzzアルゴリズムが完成します。
 
```swift
if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
    print("FizzBuzz")
} else if number.isMultiple(of: 3) {
    print("Buzz")
} else if number.isMultiple(of: 5) {
    print("Fizz")
} else {
    print(number)
}
```
このifステートメントでは、「3と5の公倍数であるかどうか」を評価する論理式が最初の条件文になっている点に注目してください。
ifステートメントの条件文は上から順に評価されます。
したがって、「3の倍数であるか」や「5の倍数であるか」を先に評価してしまうと、FizzBuzzアルゴリズムは正しく動作しません。
そうした場合、整数が`15`や`30`であっても、`3`の倍数あるいは`5`の倍数として評価されてしまいます。

## 7. 論理和演算子
_07_logical OR operator.playground_

iPhoneのロックを解除するためには、正しいパスコードを入力します。
機種によってはパスコードだけでなく、顔認証のFeceIDや指紋認証のTouchIDを使ってロックを解除することもできます。
ここでは、iPhoneのロックを解除するための条件分岐プログラムを考えましょう。
例えば、iPhone14のロックを解除するには、以下に挙げる2つの条件の少なくともどちらか一方を満たす必要があります。
- ひとつは、正しいパスコードを入力すること
- もうひとつは、顔認証をパスすること
それぞれを定数`enterdPasscode`と`passedFaceID`として定義します。
```swift
let enterdPasscode = true  // Enterd correct passcode.
let passedFaceID = false   // It cannot pass FaceID.
```
このコードは「FaceIDは認証できなかったが、正しいパスコードを入力できた」ことを意味します。
\
\
少なくともどちらか一方の条件が満たされる場合にコードを実行するには、次のようなif-else ifステートメントを記述できます。
次のif-else ifステートメントは、「正しいパスコードの入力」か「FaceIDによる認証」のどちらか一方でもできた場合にiPhoneのロックを解除する条件分岐プログラムです。
```swift
if enterdPasscode {
    print("iPhone is unlocked!")
} else if passedFaceID {
    print("iPhone is unlocked!")
}
// Prints iPhone is unlocked!
```
定数`enterdPasscode`が`true`（つまり、正しいパスコードを入力できる）なので、このプログラムを実行するとiPhoneのロックは解除されます。
しかしながら、この条件分岐プログラムは実行するコードが同じなのに、if節とelse if節があるのはナンセンスです。
論理和演算子`||`を使うことで、このif-else ifステートメントを改善できます。
\
\
論理和は「ふたつの条件のうち、どちらか一方でも`true`であれば、式全体が`true`になる」演算です。
```swift
true || true    // true
true || false   // true
false || true   // ture
false || false  // false
```
ふたつの条件が両方とも`false`でない限り、論理和演算式は`true`を返します。
\
\
論理和演算子`||`を使うと、先ほどのif-elseifステートメントは次のように記述できます。
 
```swift
if enterdPasscode || passedFaceID {
    print("iPhone is unlocked!")
}
// Prints iPhone is unlocked!
```
実行した結果はそのままですが、コードの重複がなくなって読みやすくなりました。

## 8. 論理演算子
_08_logical NOT operator.playground_

Swiftの論理演算は論理積と論理和の他に**論理否定**があります。
論理否定は`Bool`値の真偽を反転する演算です。
Swiftプログラミングでは、疑問符`!`の論理否定演算子を使って、これを実行できます。
論理否定演算子は「真偽値の直前」に記述する、いわゆる前置き演算子です。
```swift
!true   // false; not true
!false  // true; not false
```
`true`の論理否定は`false`、`false`の論理否定は`true`になります。
論理否定演算子!を英語の*not*に置き換えると、1行目は`not true`、2行目は`not false`と読むことができるので、コードの意味が理解できます。
\
\
次のifステートメントは、iPhoneのロックを解除する条件分岐プログラムです。
「正しいパスコードを入力する」か「FaceIDで認証する」ことができると、iPhoneはロックを解除します。
```swift
let enterdPasscode = false
let passedFaceID = true
if enterdPasscode || passedFaceID {
    print("iPhone is unlocked!")
}
```
このifステートメントの条件文は...\
「パスコードが正しくない」ことと「FaceIDが認証できない」ことを同時に満たさない場合に、iPhoneのロックを解除する\
...と言い換えることもできます。
論理否定演算子`!`を使って、先ほどのifステートメントを書き直すことができます。
まず、「パスコードが正しくない」と「FaceIDが認証できない」は、それぞれの真偽値を否定します。
```swift
if !enterdPasscode || !passedFaceID {
    print("iPhone is unlocked!")
}
```
次に、二つの条件を同時に満たさないことは、論理積ANDで連結してから式全体を否定します。
```swift
if !(!enterdPasscode && !passedFaceID) {
    print("iPhone is unlocked!")
}
Prints iPhone is unlocked!
```
実行した結果に変わりはありません。
しかしながら、論理積で連結されている否定と否定がさらに否定されているので、コードは著しく読みづらくなってしまいました。
このような場合、論理式を説明する変数などを宣言しておくと、コードの読みやすさを改善できます。
以下に定義する定数lockedには、二つの真偽値が両方とも`false`になった場合に`true`が設定されます。
つまり、「パスコードが正しくない」ことと「FaceIDが認証できない」ことが同時に起こったら、iPhoneをロックすることを示します。
```swift
let locked = !enterdPasscode && !passedFaceID
```
この説明変数`locked`を使って、 iPhoneのロックを解除する条件分岐プログラムを記述します。
```swift
if !locked {
    print("iPhone is unlocked.")
}
// Prints iPhone is unlocked.
```
このifステートメントは「*If not locked, Print "iPhone is unlocked."*」と読めます。
コードは1行増えましたが、スラスラと読みやすくなりました。
もちろん、 実行した結果は最初のifステートメントと同じです。
2つの条件が両方とも`false`でない限り、iPhoneのロックは解除されます。
\
\
クルマで気持ちよくドライブしていることを想像してみましょう。
そこにスピードバンプ（通行する車両を意図的に減速させるために施された道路上の隆起）があると、徐行しなければいけません。
読み手に配慮がない複雑なコードは「プログラムのスピードバンプ」です。
できるだけ読みやすくて理解が容易なコードにすると、プログラマーはコードをスラスラと読み進めることができます。

## 9. 三項演算子
_09_ternary conditional operator.playground_

コードを読みやすく、簡潔に記述することはプログラミングにおける重要なテクニックです。
ここでは、単純なifステートメントをより簡潔に記述する方法を学びます。
次のifステートメントは、天気が良ければ「お出かけしよう」というメッセージを、そうでないなら「家で過ごす」というメッセージを出力する条件分岐プログラムです。\
```swift
let isFine = true  // This means fine weather.
if isFine {
    print("Let's go out.")
} else {
    print("Stay home.")
}
// Let's go out.
```
定数`isFine`は「天気が良いかどうか」を示します。
このプログラムを実行すると、「お出かけしよう」というメッセージが出力されます。
\
\
このような単純な条件分岐ロジックは、**三項条件演算子**を使用するとより簡潔に記述できます。\
三項条件演算子は、疑問符`?`とコロン記号`:`を組み合わせて記述します。
そして、三項条件演算子という名前が示す通り、「条件」と「真の値」および「偽の値」という3つの項で形成される演算子です。
次のコードは、定数`isFine`が`true`なら`"Let's go out!"`、そうでないなら`"Stay home."`を取得します。
```swift
isFine ? "Let's go out!" : "Stay home."    // Let's go out!
```
三項条件演算子の疑問符`?`は、その前後に空白スペースがある点に注目してください。
\
\
`print()`関数を使えば、三項演算子の返り値をそのまま出力できます。
```swift
print(isFine ? "Let's go out!" : "Stay home.")
// Let's go out!
```
三項演算子は特殊な構文に見えますが、実際のSwiftプログラミングでは極めて有用です。
単純なifステートメントは、積極的に三項条件演算子で記述すると良いでしょう。

