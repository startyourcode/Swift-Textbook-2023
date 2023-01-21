/*:
 # default parameter values
 __`メソッドのパラメータに既定値を設定する`__
 \
 \
 関数を定義する際、パラメータに既定値を設定しておくことができます。
 
 以下に定義する`doSomething(:)`関数は、通常のパラメータをひとつだけ受け取ります。
 
 ```swift
 func doSomething(parameter: String) {
     print(parameter)
 }
 ```

 関数のパラメータに既定値を設定するには、パラメータの型を明示した後に代入演算子`=`を使って値を設定します。
 
 ```swift
 func doSomething(parameter: String = "ABC") {
     print(parameter)
 }
 ```
 
 パラメータに既定値が設定されている関数を呼び出す場合、そのパラメータに対する値の指定を省略できます。
 
 ```swift
 doSomething()   // Prints ABC.
 ```

 パラメータに値が渡されなかったので、既定値の`"ABC"`が出力されました。

 既定値を無視して、関数の呼び出し側でパラメータに値を渡すこともできます。

 ```
 doSomething(parameter: "123")   // Prints 123.
 ```

 関数のパラメータリストでは、「既定値があるパラメータ」は後方に並べます。
 対照的に、「既定値がないパラメータ」はリストの先頭あるいは、より前方に並べます。
 
 ```swift
 func doAnotherthing(parameter: Int, anotherParameter: Int = 123)  {
     print(parameter + anotherParameter)
 }
 ```

 大抵の関数において、「既定値がないパラメータ」のほうが「既定値があるパラメータ」よりも重要です。
 常に「既定値がないパラメータ」を先に宣言しておくと、関数を呼び出した際に一部のパラメータが省略されても「どの関数を呼び出したか」が認識しやすくなります。
 */
func doSomething(parameter: String = "ABC") {
    print(parameter)
}
doSomething()
doSomething(parameter: "123")

func doAnotherthing(parameter: Int, anotherParameter: Int = 123)  {
    print(parameter + anotherParameter)
}
