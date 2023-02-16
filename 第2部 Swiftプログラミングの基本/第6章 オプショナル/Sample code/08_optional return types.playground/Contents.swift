func someMethod(isReturnNil: Bool) -> String? {
    return isReturnNil ? nil : "Abracadabra"
}

let value = someMethod(isReturnNil: true)
print(value ?? "Nil returned...")
