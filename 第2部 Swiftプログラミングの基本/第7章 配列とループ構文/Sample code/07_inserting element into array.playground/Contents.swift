/*:
 # inserting element into array
 __`配列に要素を挿入する`__
 \
 \
 基本的に、配列要素の追加は「新しい要素が最後尾に配置される」ことを意味します。
 これに対して、配列の「任意の位置」に新しい要素を配置する操作は、特に**挿入**といいます。
 配列に要素を挿入するには、`Array`型の`insert(_:at:)`メソッドを使用できます。
 `insert(_:at:)`メソッドのパラメータには、「挿入したい値」と「挿入する位置のインデックス」を指定します。
 \
 \
 例として、週の曜日を配列に並べましょう。
 
 変数`week`は、週の曜日を示す文字列の配列です。
 
 ```swift
 var week = ["Monday"]
 ```

 今のところ、要素は「月曜」だけなので、要素数は`1`です。
 同時に、有効なインデックスは`0`だけであることを理解してください。
 \
 \
 それでは、`week`配列の先頭に「日曜」を挿入しましょう。
 先頭に挿入するには、`insert(_:)`メソッドのパラメータに`0`を指定します。

 ```swift
 week.insert("Sunday", at: 0)       // ["Sunday", "Monday"]
 ```
 
 実行した結果、`week`配列の先頭に「日曜」を挿入できたので、2つの要素が並んでいます。
 つまり、`week`配列の有効なインデックスは「先頭の`0`」か「最後尾の`1`」のいずれかです。
 
 ちなみに、`insert(_:at:)`メソッドに「有効な範囲より`1`だけ大きいインデックス」を指定すると、最後尾に挿入できます。

 ```swift
 week.insert("Saturday", at: 2)     // ["Sunday", "Monday", "Saturday"]
 ```

 実行した結果、配列の最後尾に「土曜」が追加されました。
 
 なお、`insert(_:at:)`メソッドに「無効なインデックス」を指定すると、ランタイムエラーが発生します。
 
 ```swift
 week.insert("Wednesday", at: 4)  // runtime error; index is out of range.
 ```
 
 指定したインデックスが無効であることは、コンパイル時に検出できません。
 配列を操作する際は常に、有効なインデックスの範囲に注意しましょう。
 \
 \
 そして、いくつかの要素を同時に挿入したい場合は、 `insert(contentOf:at:)`メソッドを使用できます。
 
 次のコードは、月曜と土曜の間に「火曜から金曜までの配列」を挿入します。
 
 ```swift
 week.insert(contentsOf: ["Tuesday", "Wednesday", "Thursday", "Friday"], at: 2)
 // ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
 ```

 実行した結果、`week`配列に「日曜」から「土曜」まで7つの曜日を並べることができました。
 */
var week = ["Monday"]

week.insert("Sunday", at: 0)
week.insert("Saturday", at: 2)
//week.insert("Wednesday", at: 4)   // runtime error

week.insert(contentsOf: ["Tuesday", "Wednesday", "Thursday", "Friday"], at: 2)
