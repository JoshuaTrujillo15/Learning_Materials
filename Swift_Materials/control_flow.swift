//for-in
let names = ["anna", "alex", "brian", "jack"]
for name in names {
    print(name)
}

//dict
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (name, legs) in numberOfLegs {
    print("\(name) has \(legs) legs")
}

//numeric range
for index in 1...5 {
    print(index) //1 2 3 4 5
}

//if value from sequence not needed, ignore value with _
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

//not use closed ranges
//draw 60 tick marksm starting with 0
let minutes = 60
for tickMark in 0..<minutes {//excludes 60
    //render tick mark each minute 60 times
}

//render one mark every five minutes
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    //render tick every 5 minutes
}

//closed range available by using stride()
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    //render every three hours 3, 6, 9, 12
}

//while
//eval, then execute
while condition {
    //code
}

//repeat-while
//execute then eval
repeat {
    //code
} while condition

//if
if condition {
    //code
} else if {
    //alt code
} else {
    //other alt code
}

//switch
switch valueToConsider {
    case value1:
        //value1Response
    case value2, value3:
        //value2Or3Response
    default:
        //ifNothingElse
}

//no explicit break needed, finishes as soon as one is met
//all cases must have valid code

//interval matching
let approxCount = 62
let countedThings = "moons orbiting saturn"
let naturalCount: String
switch approxCount {
    case 0:
    naturalCount = "no"
    case 1..<5:
    naturalCount = "a few"
    case 5..<12:
    naturalCount = "several"
    case 12..<100:
    naturalCount = "dozens of"
    case 100..<1000:
    naturalCount = "hundreds of"
    default: 
    naturalCount = "many"
}
print("there are \(naturalCount) \(countedThings)")//there are dozens of moons orbiting Saturn

//tuple
let somePoint = (1, 1)
switch somePoint {
    case (0, 0):
        print("origin")
    case (_, 0):
        print("on x axis")
    case (0, _):
        print("on y axis")
    case (-2...2, -2...2):
        print("within -2,-2 and 2,2")
    default:
        print("outside box")
}

//value bindings
let anotherPoint(2, 0)
switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
}

//control transfer statements

//continue
//stop and start at beginning

//break
//ends execution immediately
//break in switch
//for no code in a case statement

//fallthrough
//optin to allow switch statement to run through more cases after case met

//labeled statements
//break ends all nested statemnts
labelName: while condition {
    statements
    break labelName //breaks the loop explicitly by label name
}

//guard
//like if, but must have else to be executed if false
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return //return if person["name"] == nil
    }
    print("hello \(name)!")
}

//api availability
if #available(iOS 10, macOS 10.12, *) {
    //use ios10 apis and use macos10.12 apis on macos
} else {
    //fall back to earlier ios and macos api
}

//if #available(platformName version, ..., *) {
    //statement if apis available
//} else {
    //fallback statements
//}