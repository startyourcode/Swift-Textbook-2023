!true
!false

let enterdPasscode = false
let passedFaceID = true

if !(!enterdPasscode && !passedFaceID) {
    print("iPhone is unlocked!")
}

let locked = !enterdPasscode && !passedFaceID
if !locked {
    print("iPhone is unlocked.")
}
