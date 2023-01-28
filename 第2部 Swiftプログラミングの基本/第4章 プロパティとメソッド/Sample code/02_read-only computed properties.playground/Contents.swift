/*:
 # read-only computed properties
 __`読み取り専用の計算プロパティ`__
 \
 \
 計算プロパティにおいて、セッターの実装は任意です。
 対照的に、ゲッターの実装は必須です。
 セッターのない計算プロパティは、アクセスが読み取り専用になります。
 つまり、読み取り専用の計算プロパティには値を設定できません。
 \
 \
 例として、長方形をモデル化した`Rectangle`型を考えます。
 
 ```swift
 struct Rectangle {
     var height: Double
     var width: Double
 }
 ```
 
 `height`プロパティは「長方形の高さ」を、`width`プロパティは「長方形の横幅」を示します。
 \
 \
 ここに、面積を示す`area`プロパティを実装しましょう。
 ゲッターが返す値は「高さと横幅の乗算」で計算できます。
 
 ```swift
 struct Rectangle {
     var height: Double
     var width: Double
     
     var area: Double {
         get {
             return height * width
         }
     }
 }
 ```
 
 長方形の場合、その面積が決まっていても「図形の横幅と高さがいくつになるか」は曖昧です。
 したがって、`area`計算プロパティにおいて、セッターが「面積に基づいて、高さと横幅に値を設定する」ことはナンセンスです。
 そのような場合、セッターの実装を省略できます。
 \
 \
 セッターがない場合、`get`キーワードとそのコードブロックを省略できます。
 
 ```swift
 struct Rectangle {
     var height: Double
     var width: Double
     
     var area: Double {
         return height * width
     }
 }
 ```
 
 さらに、ゲッター節では「その実装が1行だけ」なら`return`キーワードを省略できます。
 これは「関数やメソッドにおける`return`の省略」と同じ要領です。
 
 ```swift
 struct Rectangle {
     var height: Double
     var width: Double
     
     var area: Double { height * width }
 }
 ```

 インラインに記述することで、計算プロパティの宣言と定義がシンプルな印象になります。
 */
struct Rectangle {
    var height: Double
    var width: Double
    
    var area: Double { height * width }
}
