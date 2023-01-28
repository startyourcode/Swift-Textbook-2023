/*:
 # logical operators
 __`論理演算子`__
 \
 \
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
 */
!true
!false

let enterdPasscode = false
let passedFaceID = true

if !(!enterdPasscode && !passedFaceID) {
    print("iPhone is unlocked!")
}

let locked = !enterdPasscode && !passedFaceID
if !locked {
    print("iPhone is unlocked.")
}


