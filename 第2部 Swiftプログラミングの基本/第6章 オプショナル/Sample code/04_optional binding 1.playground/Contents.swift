var secretSpell: String? = "Abracadabra"

if secretSpell != nil {
    print("You got \(secretSpell!).")
}

if let nonOptioalSpell = secretSpell {
    print("You got \(nonOptioalSpell).")
}

if let secretSpell {
    print("You got \(secretSpell).")
}
