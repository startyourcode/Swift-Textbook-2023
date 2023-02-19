var myFeeling: String? = "Happy"

if myFeeling != nil {
    print(myFeeling!)
} else {
    print("No feeling...")
}

print(myFeeling ?? "No feeling...")
