func doSomething(parameter: String = "ABC") {
    print(parameter)
}

doSomething()
doSomething(parameter: "123")

func doAnotherthing(parameter: Int, anotherParameter: Int = 123)  {
    print(parameter + anotherParameter)
}
