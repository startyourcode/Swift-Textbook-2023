var forecasts = [String: Double]()

forecasts["Tokyo"] = 0.3
forecasts["Los Angeles"] = 0.2
forecasts["London"] = 0.7

print(forecasts)

forecasts["Tokyo"]
forecasts["California"]

if let forecast = forecasts["Tokyo"] {
    print("Chance of precipitation in Tokyo is \(forecast * 100)%.")
}
