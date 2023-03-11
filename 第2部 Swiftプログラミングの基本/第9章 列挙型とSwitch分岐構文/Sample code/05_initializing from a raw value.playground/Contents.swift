enum Month: Int {
    case january = 1, february, march, april, june, july, august, september, octber, november, december
}

if let birthMonth = Month(rawValue: 13) {
    print("You are born in \(birthMonth)")
} else {
    print("Month can be any of 1-12.")
}

