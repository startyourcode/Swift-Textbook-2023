let number = Int("12345")
print(number ?? "Initialzation failed...")

struct Rectangle {
    let width: Int
    let height: Int
        
    init?(width: Int, height: Int) {
        if width <= 0 || height <= 0 {
            return nil
        }
        self.width = width
        self.height = height
    }
}

let smallRectange = Rectangle(width: 1, height: 2)
