extension Int {
    // 奇数かどうか
    var isOddNumber: Bool {
        return (self % 2) != 0
    }
    
    // 偶数かどうか
    var isEvenNumber: Bool {
        return (self % 2) == 0
    }
    
    // 素数かどうか
    var isPrimeNumber: Bool {
        if self == 1 { return false }
        for i in 2..<self {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}
