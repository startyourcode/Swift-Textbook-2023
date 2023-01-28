/*:
 # logical OR operators
 __`論理和演算子`__
 \
 \
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
 */
let enterdPasscode = true
let passedFaceID = false

if enterdPasscode || passedFaceID {
    print("iPhone is unlocked!")
}

true || true
true || false
false || true
false || false
