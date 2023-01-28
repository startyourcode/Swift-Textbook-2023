/*:
 # optional binding
 __`オプショナル・バインディング`__
 \
 \
 オプショナル値を安全にアンラップするには、ifステートメントを利用できます。
  
 以下のコードは、「秘密の呪文」を示すオプショナルな`String`値を安全にアンラップします。
 
 ```swift
 var secretSpell: String? = "Abracadabra"

 if secretSpell != nil {
     print("You got \(secretSpell!).")
 }
 // PrintsYou got Abracadabra.
 ```
 
 この方法は安全にオプショナル値を扱えますが、煩わしいと感じる面もあります。
 `if`ステートメントのボディではオプショナル値が安全であることを確認済みなのに、扱うたびに疑問符`!`をつけてアンラップする必要があります。
 **オプショナル・バインディング**という特別な記法を使用すると、これらの手間を回避できます。
 
 次のコードは、ifステートメントのオプショナルバインディングです。

 ```swift
 if let nonOptionalSpell = secretSpell {
     print("You got \(nonOptionalSpell).")
 }
 // Prints You got Abracadabra.
 ```
 
 実行すると、オプショナル・バインディングが成功して、秘密の呪文「アブラカダブラ」がコンソールに出力されます。
 
 この`if-let`ステートメントの条件文は...\
 `もし、変数secretSpellに具体的な値が存在するなら、その値を定数nonOptionalSpellに割り当てる`\
 ...と読むことができます。
 
 「秘密の呪文」が`nil`ではない場合に限り、`if`ステートメントのボディで定数`nonOptionalSpell`が使用できます。
 定数`nonOptionalSpell`には「アンラップした秘密の呪文」が設定されているので、使用する際に感嘆符`!`をつける必要ありません。
 なお、オプショナル・バインディングで宣言した定数および変数を使用できるのは、`if`ステートメントのボディの中だけです。
 ifステートメントから脱出した後の行からは参照できません。
 \
 \
 オプショナル・バインディングはさらに省略して記述できます。

 ```swift
 if let secretSpell {
     print("You got \(secretSpell).")
 }
 // Prints You got Abracadabra.
 ```
 
 この省略記法では、アンラップした値を設定するための「新しい定数」について、その名前を考える手間が省けます。
 */
var secretSpell: String? = "Abracadabra"

if secretSpell != nil {
    print("You got \(secretSpell!).")
}

if let nonOptioalSpell = secretSpell {
    print("You got \(nonOptioalSpell).")
}

if let secretSpell {
    print("You got \(secretSpell).")
}
