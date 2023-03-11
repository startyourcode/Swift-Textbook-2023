var week = ["Monday"]

week.insert("Sunday", at: 0)
week.insert("Saturday", at: 2)
//week.insert("Wednesday", at: 4)   // runtime error

week.insert(contentsOf: ["Tuesday", "Wednesday", "Thursday", "Friday"], at: 2)
