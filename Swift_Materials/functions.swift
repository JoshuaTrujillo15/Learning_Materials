//defining functions
func greet(person: String) -> String {
    let greeting = "hello " + person + "!"
    return greeting
}
print(greet(person: "anna")) //hello anna!

func greetAgain(person: String) -> String {
    return "hello again, " + person + "!"
}

//no param
func sayHelloWorld() -> String {
    return "hello world"
}
print(sayHelloWorld())

//multiple param
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "tim", alreadyGreeted: true)) //hello again, tim!

//no return
func greet(person: String) {
    print("hello, \(person)!")
}
greet(person: "dave")
//no return returns Void type ()

//ignore return value
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
let myString = "hello world"
printAndCount(string: myString) //prints and returns 12
printWithoutCounting(string: myString) //print, no return

//multiple returns
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min: \(bounds.min), max: \(bounds.max)")//min: -6, max: 109

//implicit return
//if function body is one statement, return is implied