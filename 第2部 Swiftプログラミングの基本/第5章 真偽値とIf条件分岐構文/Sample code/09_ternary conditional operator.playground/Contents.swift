/*:
 # ternary conditional operator
 __`三項演算子`__
 \
 \
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
 */
let isFine = true

if isFine {
    print("Let's go out.")
} else {
    print("Stay home.")
}

print(isFine ? "Let's go out!" : "Stay home.")

