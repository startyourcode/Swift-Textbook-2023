/*:
 # constants
 `定数`
 \
 \
 プログラミングでは、「値に名前をつけて呼び出せる」と便利な場面があります。

 例えば、「地球の直径」というデータを頻繁に扱うプログラムがあったとします。
 「地球の直径」はおよそ`12,756`kmなので、整数リテラルとして扱うかもしれません。

 ```swift
 12756
 ```
 
 このコードを誰かが見たとき、`12756`という数値だけでは「それが地球の直径である」ことを読み手に伝えることはできません。
 \
 \
 コメントを残しておけば、読み手に「これは地球の直径だ」と伝えられるかもしれません。
 
 ```
 12756  // diameter of the earth
 ```
 
 とはいえ、プログラムで「地球の直径」を使用するたびに、プログラマーが「直径は`12,756`である」ことを思い出すはナンセンスです。
 もしかすると、間違って覚えてしまうかもしれないし、キーボードの入力を誤ってしまう恐れもあります。
 \
 \
 そのような問題は「値に名前をつけておいて、必要なときに呼び出す」仕組みを利用すると、解決できます。
 Swiftでは、`let`キーワードを使って「値に名前をつける」ことができます。
 
 次のコードは `12,756`という整数に「地球の直径」という名前をつけます。
 
 ```swift
 let diameterOfEarth = 12756
 ```
 
 このコードは、「プログラムの中で`diameterOfEarth`」という名前を使うことを、コンパイラに**宣言**します。
 同時に、「`diameterOfEarth`の値が`12756`である」ことを**定義**しています。
 なお、このコードで使用しているイコール記号は、代入演算子`=`といいます。
 \
 \
 宣言した名前を呼び出すと、その値を**参照**できます。
 
 Xcodeは「プログラムの中で、どんな識別子が宣言されたか」を追跡しています。
 そのおかげで、呼び出したい名前を途中まで入力すれば、すぐさま補完機能が作動します。

 `diam`

 候補を選んだら、Tabキーを使って入力を完了できます。

 `diameterOfEarth`
 
 コードを実行すると、リザルトサイドバーに値が表示されます。

 ```
 diameterOfEarth    // 12756
 ```

 値を呼び出すためにつけた名前のことを、**識別子**といいます。
 特に、`let`キーワードを使って宣言した識別子は、**定数°°といいます。
 そして、名前で呼び出せるようにするために設定した値のことを**既定値**といいます。
 \
 \
 定義した定数は、プログラムの中でいつでも何度でも呼び出せます。
 
 ```
 diameterOfEarth    // 12756
 diameterOfEarth
 diameterOfEarth
 ```
 
 呼び出した定数が返す値は、「定義したときと常に同じである」ことが保証されます。
 当たり前なことのように思われますが、これはとても重要です。
 */
/*:
 ## 型推論
 
 ここで、定数`diameterOfEarth`のデータ型を確認してみましょう。
 インスペクターを表示して、「クイックヘルプインスペクター」を選択してください。
 そのまま、コードで呼び出した定数`diameterOfEarth`をクリックします。
 
 すると、「`Int`型として宣言されている」ことがわかります。
 
 `let diameterOfEarth: Int`
 
 これは、定数`diameterOfEarth`は宣言時に「整数が設定された」ので、コンパイラが「`Int`型であると推論した」ことを示しています。
 */
12756   // diameter of the earth
let diameterOfEarth = 12756
diameterOfEarth
