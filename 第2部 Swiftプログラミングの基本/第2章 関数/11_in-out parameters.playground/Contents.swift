/*:
 # in-out parameters
 __`In-Outパラメータ`__
 \
 \
 原則として、関数が受け取ったパラメータは定数として扱われます。
 そのため、関数のボディ内でパラメータの値を変更しようとすると、コンパイルエラーを引き起こします。
 
 例えば、以下に定義する`swapTwoToys(_:_:)`関数は「2つの文字列値」を受け取ります。

 ```swift
 func swapTwoToys(_ this: String, _ that: String) {
     let temporary = this
     this = that          // error; Cannot assign to value
     that = temporary     // error; Cannot assign to value
 }
 ```
 
 実装では、受け取った2つのパラメータの値を交換します。
 具体的には、最初に定数`temporary`に`this`の値を預けます。
 次に、パラメータ`this`を`that`の値で更新します。
 そして、`temporary`に預けておいた`this`の値でパラメータ`that`を更新します。
 しかし、パラメータは定数として扱われるので、それぞれの値を更新しようとしている2行目と3行目のコードは不正です。
 
 この仕組みは、パラメータの値が意図せずに変更されることを回避します。
 \
 \
 関数のボディでパラメータの値を変更できるようにするには、inoutパラメータを利用します。
 inoutパラメータを変更した結果は、関数を呼び出した側でも反映されます。

 関数にin-outパラメータを定義するには、パラメータ型の直前に`inout`キーワードを記述します。
 
 ```swift
 func swapTwoToys(_ this: inout String, _ that: inout String) {
     let temporary = this
     this = that
     that = temporary
 }
 ```
 
 エラーが解消されて、パラメータの値を交換（スワップ）するコードを実装できました。
 \
 \
 `swapTwoToys(_:_:)`関数を呼び出して、友達とおもちゃの交換しましょう。
 自分は「飛行機のおもちゃ」を持っていて、友達は「ボートのおもちゃ」を持っています。
 
 ```swift
 var myToy = "🛩"
 var yourToy = "🚤"
 ```
 
 それでは、`swapTwoToys(_:_:)`関数を呼び出して、2つのオモチャを互いに交換します。

 ```swift
 swapTwoToys(&myToy, &yourToy)
 ```

 2つの値が`swapTwoToys(_:_:)`関数に渡されるとき、引数名にアンパサンド記号`&`が付くことに注意してください。
 このアンパサンド記号`&`は、「その値が関数によって変更されるかもしれない」ことを明確にします。
 なお、関数のin-outパラメータに渡すことができる値は、変数だけです。
 定数とリテラルは値を更新できないので、関数のin-outパラメータに渡せません。
 また、in-outパラメータには既定値を設定できません。
 \
 \
 in-outパラメータは、以下のように動作します。
 
 - まず、関数が呼び出された際に、引数の値を関数にコピーします。
 - 次に、関数のボディにおいて、コピーされた値が変更されて、関数が終了します。
 - 最後は、関数の呼び出し元に戻り、元の値を「変更された値」に置き換えます。

 \
 上の例では、関数の外部で定義された変数`myToy`と`yourToy`の値が、`swapTwoToys(_:_:)`関数によって互いに入れ替わりました。

 ```swift
 myToy   // 🚤
 yourToy // 🛩
 ```
 
 自分のおもちゃが「ボート」になって、友達のおもちゃが「飛行機」になりました。
 \
 \
 in-outパラメータ自体は、関数から返される値ではありません。
 実際に、上記の`swapTwoToys(_:_:)`関数も返り値の型は定義されておらず、値を返しません。
 しかし、外部の変数`myToy`と`yourToy`の値を交換しています。
 つまり、in-outパラメータは関数が「そのスコープ外に影響を与える」方法のひとつです。
 
 */
func swapTwoToys(_ this: inout String, _ that: inout String) {
    let temporary = this
    this = that
    that = temporary
}

var myToy = "🛩"
var yourToy = "🚤"
swapTwoToys(&myToy, &yourToy)
myToy
yourToy
