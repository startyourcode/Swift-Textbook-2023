/*:
 # print function and console
 `Print機能とコンソール`
 \
 \
 プログラムに潜んでいる欠陥や「意図しない動作の原因」を**バグ**といいます。
 そして、バグを修正する作業のことを**デバッグ**といいます。
 デバッグを行うには、プログラムが意図した通りに動いていることをチェックする必要があります。
 ここでは、実行中のプログラムが正しく動作していることを確認する方法を解説します。
 \
 \
 Playgroundのワークスペースには、「デバッグの際に役立つ情報」を提供してくれる**デバッグエリア**があります。
 デバッグエリアは「画面右下のアイコン」をクリックすると、表示できます。
 あるいは、メニューバーから「View > Debug Area > Show Debug Area」を選択します。
 ショートカットキーの「shift + command + Yキー」でも、表示を切り替えることができます。
 
 デバッグエリアは「特定のコードを実行した結果」や「発生したエラーの詳細情報」を確認するために利用されます。
 このような領域は**コンソール**と呼ばれることもあります。
 \
 \
 Swiftの`print`機能を使用すると、「コードを実行した結果」がコンソールに出力されます。
 
 プログラマーの間では伝統的に、初めてコンソールに出力する値は「ハロー、ワールド」にする慣習があります。
 次のコードを実行すると、文字列をコンソールに出力できます。
 
 ```
 print("Hello, world!")    // Hello, world!
 ```

 この仕組みを上手に利用すれば、実行したプログラムのコードを追跡できます。
 \
 \
 先ほどの`print`機能は、括弧`()`の中に受け取った`"Hello, world!"`という文字列を出力しました。
 `print`機能には数値のデータを渡すこともできます。
 
 ```
 print(123)    // prints 123
 ```
 
 この`print`機能は、Swiftに用意されている様々な**関数**のひとつです。
 `print()`関数とコンソールを使って「実行中のコードを追跡する」ことは、デバッグの基本です。
 プログラムが期待した通りに動かない場合は、デバッグに取り組んでみましょう。
 \
 \
 Swiftには`print()`関数の他にも、様々な機能を持った関数がたくさん用意されています。
 関数を使いこなすことは、プログラミングのスキルアップには欠かせません。
 少しずつ、慣れていきましょう。
 */
print("Hello, world!")
print(123)

