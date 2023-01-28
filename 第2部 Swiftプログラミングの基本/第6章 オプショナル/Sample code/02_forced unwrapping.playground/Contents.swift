/*:
 # forced unwrapping
 __`強制的なアンラップ`__
 \
 \
 オプショナルなデータ型は、その値に「`nil`が設定されるかもしれない」ことを意味します。

 以下に定義する変数`optionalData`は、オプショナルな`Int?`型です。

 ```swift
 var optionalData: Int? = 123
 ```

 変数`optionalData`はオプショナルなので、Swiftは`nil`の設定を許容します。
 
 変数`optionalData`をコンソールに出力すると、値が「オプショナルでラップされている」ことがわかります。
 
 ```swift
 print(optionalData)   // Prints optional(123)
 ```
 
 これは、「このままでは通常の整数として扱えない」ことを意味します。
 
 例えば、変数`optionalData`に足し算をしようとすると、コンパイラはエラーを報告します。

 ```swift
 print(optionalData + 1)   // error: Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
 ```
 
 このエラーを解消するには、警告文が示す通り、「オプショナルな`Int?`型をアンラップして通常の`Int`型にする」必要があります。
 オプショナルな値をアンラップするには、その値の末尾に感嘆符`!`をつけてやります。
 
 変数`optionalData`をアンラップすると、設定されていた「通常の整数データ」を取り出せます。
 
 ```swift
 print(optionalData! + 1)  // Prints 124
 ```
 
 足し算が正しく実行できるようになりました。
 エラーは解消されて、アンラップされた変数`optionalData`は「通常の`Int`型整数」として扱えることが確認できました。
 \
 \
 オプショナル値に疑問符`!`をつけると、そこに設定されている具体的な値を取得できます。
 このようにしてオプショナル値のデータを取得する方法を、**強制的なアンラップ**といいます。
 */
var optionalData: Int? = 123
print(optionalData! + 1)


