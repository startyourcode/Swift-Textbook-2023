import Darwin
protocol Friendly {
    func showSmile()
}

struct Person: Friendly {
    func showSmile() {
        print("😋")
    }
}

let myFriend = Person()
myFriend.showSmile()
