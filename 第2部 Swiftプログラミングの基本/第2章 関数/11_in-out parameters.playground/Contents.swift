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
