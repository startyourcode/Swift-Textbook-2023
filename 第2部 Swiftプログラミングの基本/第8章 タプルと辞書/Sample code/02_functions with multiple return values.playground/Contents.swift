func minMax(_ numbers: [Int]) -> (min: Int, max: Int) {
    var currentMin = numbers[0]
    var currentMax = numbers[0]
    
    for number in numbers[1..<numbers.count] {
        if number < currentMin {
            currentMin = number
        } else if currentMax < number {
            currentMax = number
        }
    }
    
    return (currentMin, currentMax)
}

let bounds = minMax([61, 22, 73, 34, 15])
print("min is \(bounds.min), max is \(bounds.max)")
