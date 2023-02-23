let cityData = ["Tokyo": 13_960_000, "Madrid": 3_223_000, "Monaco": 39_240]

for (city, population) in cityData {
    print("\(city): \(population).")
}

[String](cityData.keys)
[Int](cityData.values)

var total = 0
for value in cityData.values {
    total += value
}
print("Total population: \(total).")

