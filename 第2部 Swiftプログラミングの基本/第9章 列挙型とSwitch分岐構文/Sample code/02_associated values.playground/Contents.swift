enum Contact {
    case email(String)
    case phone(Int, Int, Int)
}

var friendContact = Contact.email("hello@iCloud.com")
print(friendContact)

friendContact = .phone(090, 1234, 5678)
print(friendContact)
