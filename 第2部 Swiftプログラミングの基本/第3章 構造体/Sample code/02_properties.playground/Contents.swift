/*:
 # properites
 __`プロパティ`__
 \
 \
 構造体に**プロパティ**を定義することで、データに特徴を持たせることができます。
 実際のところ、プロパティは「データ型の中に定義された変数および定数」です。
 \
 \
 四角形のデータに「大きさ」という特徴を持たせましょう。
 
 次のコードは、`Rectangle`型に「高さ」と「横幅」を示すプロパティを定義します。
 
 ```swift
 struct Rectangle {
     var height = 0
     var width = 0
 }
 ```
 
 `height`プロパティと`width`プロパティは、それぞれが「高さ」と「横幅」を示します。
 ここでは、どちらのプロパティにも規定値として`0`を設定しました。
 これらのプロパティを利用して、インスタンスごとに「四角形の大きさ」を設定できます。
 \
 \
 次のコードは、インスタンスを作成してプロパティを参照します。
 
 ```swift
 var rectangle = Rectangle()
 rectangle.height   // 0
 rectangle.width    // 0
 ```
 
 インスタンスのプロパティを参照する際には、ドット記号`.`を介してアクセスします。
 プロパティを参照すると、既定値の`0`を取得できます。
 \
 \
 このインスタンスが示す四角形の大きさを「高さを`20`、横幅を`30`」に設定してみましょう。

 ```swift
 rectangle.height = 20
 rectangle.width = 30
 ```
 
 インスタンスのプロパティを更新する際にも、ドット記号`.`を介してアクセスします。
 このような記述方法を**ドットシンタックス**といいます。
 \
 \
 再度、インスタンスのプロパティを参照すると、値が更新されていることを確認できます。
 
 ```swift
 rectangle.height   // 20
 rectangle.width    // 30
 ```
 
 プロパティを定義することによって、`Rectangle`型のインスタンスに「大きさの特徴」を持たせることができました。
 このような「インスタンスに備わる特徴」のプロパティを、特に**インスタンスプロパティ**といいます。
 */
struct Rectangle {
    var height = 0
    var width = 0
}

var rectangle = Rectangle()
rectangle.height
rectangle.width

rectangle.height = 20
rectangle.width  = 30

rectangle.height
rectangle.width
