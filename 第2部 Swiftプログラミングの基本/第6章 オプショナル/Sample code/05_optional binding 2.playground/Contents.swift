let departure: String? = "Tokyo"
let destination: String? = nil

if let departure, let destination {
    print("Depart from \(departure) for \(destination).")
} else {
    print("Determine your departure and destination.")
}
