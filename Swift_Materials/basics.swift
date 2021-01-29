// Basics of Swift

// Constants and Variables

//constant
let maxNumOfLoginAttempts = 10
//variable
var currentLoginAttempt = 0
//declare multiple in same line
var a = 0, b = 1, c = 2

//type annotations
var welcomeMessage: String
//multiple type annotations
var red, green, blue: Double

//naming constants and variables
//anything unicode and emoji
//no whitespace, mathematical symbols, private use unicode values, line or box drawing characters
let languageName = "Swift"
print(languageName)

//comments
//this
/*
also
this
*/

//semicolons
//optional, unless multiple separate statements on single line
let cat = "😹"; print(cat)

//integers
//signed (positive, zero, or negative)
//unsigned (positive or zero)

//swift: int can  be 8, 16, 32, or 64 bit
//signed 8 bit: Int8
//unsigned 32 bit: UInt32
//alternatively: Int becomes Int32 on 32 bit platform, Int64 on 64 bit
//also: UInt works the same way
var myInt: Int
var myUInt: UInt

//int bounds
let minValue = UInt8.min //0, of type UInt8
let maxValue = UInt8.max //255, of type UInt8

//double 64 bit
//float 32 bit
//double is preferred
var myDouble: Double
var myFloat: Float

//numeric literals
//int literals
//all 17
let decimalInteger = 17
let binaryInteger = 0b1001
let octalInteger = 0o21
let hexInteger = 0x11

//floating point literals
//all 12.1875
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexDouble = 0xC.3p0

//both ints and doubles can contain extra 0's and underscores for readability
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//numeric type conversion

//int conversion
//Int8 can be -128 to 127
//UInt8 can be 0 to 255
let cannotBeNegative = UInt8 = -1 //error
let tooBig = Int8 = Int8.max + 1 //error

//wrap variable with type
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//int and floating-point conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
//pi = 3.14159 and inferred to be of type Double
let intPi = Int(pi)
//intPi = 3 and inferred to be of type Int
//Floating point is always truncated, 3.9 => 3

//type aliases
//refer to existing type by a name that is contextually more appropriate
typealias AudioSample = UInt16
//use alias anywhere the original name used
var maxAmplitudeFound = AudioSample.min
//maxAmplitudeFound = 0

//boolean
let orangesAreOrange = true
let turnipsAreDelicious = false

//swift prevents non bool values being used as bool
let i = 1
if i {
    //error
}
//instead
if i == 1 {
    //compiles successfully
}

//tuples

let http404error = (404, "Not Found")
//http404 is of type (Int, String)

//get tuple values
let (statusCode, statusMessage) = http404error
print("status code: \(statusCode)")
print("status message: \(statusMessage)")

//ignore parts of tuple with (_)
let (justTheStatusCode, _) = http404error
print("status code: \(justTheStatusCode)")

//access individual element 
print("status code: \(http404error.0)")
print("status message: \(http404error.1)")

//name elements in tuple when defined
let http200status = (statusCode: 200, description: "OK")
//access elements of tuple by name
print("status code: \(http200status.statusCode)")
print("status message: \(http200status.description)")

//Int initializer converts some strings
//'123' => 123
//'hello, world' no obvious int
let possibleNum = "123"
let convertedNum = Int(possibleNum)
//convertedNum is inferred to be of type "Int?" or "optional Int"

//nil
//assign optional variable to valueless state
var serverResponseCode: Int? = 404 //404
serverResponseCode = nil //no value

//cannot use nil with non-optional constants or variables
//always declare it as optional value of appropriate type
var surveyAnswer: String?
//surveyAnswer is automatically set to nill

//if statements and forced unwrapping
//use if statement against nil
if convertedNum != nil {
    print("convertedNum contains int value")
}

//once you know optional contains value, access underlying value by adding "!"
//"!" says there is a value, use it
if convertedNum != nil {
    print("convertedNum: \(convertedNum!)")
}

//optional binding
//check if optional contains value, if so, make value available as temp constant or variable
if let actualNum = Int(possibleNum) {
    print("the string \"\(possibleNum)\" has an integer value of \(actualNum)")
} else {
    print("the string \"\(possibleNum)\" could not be converted to an integer")
}

//assign multiple optional bindings and booleans in single if
//if any values are nil or any booleans, whole if considerd false

//following statements are the same
//
if let firstNum = Int("4"), let secondNum = Int("42"), firstNum < secondNum && secondNum < 100 {
    print("\(firstNum) < \(secondNum) < 100")
}
//prints "4 < 42 < 100"

//
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber < && secondNumber < 100 {
            print("\(firstNum) < \(secondNum) < 100")
        }
    }
}
//prints "4 < 42 < 100"

//implicitly unwrapped optionals
let possibleString: String? = "optional string"
let forcedString: String = possibleString! //requires !
let assumedString: String! = "implicitly unwrapped optional string"
let implicitString: String = assumedString //no need for !

//if implicitly unwrapped optional is nil and value is accessed, triggers run time error

if assumedString != nil {
    print(assumedString!)
}
//prints "implicitly unwrapped optional string"

//implicitly unwrapped optional with optional binding to unwrap value in single statement
if let definiteString = assumedString {
    print(definiteString)
}
//prints "implicitly unwrapped optional string"

//error handling
func canThrowAnError() throws {
    //this func may or may not throw an error
}

//function indicates it can throw error in declaration with throws
//when calling func that can throw, prepend with try
//swift auto propagates errors out of current scope until handled by catch
do {
    try canThrowAnError()
    //no error was thrown
} catch {
    //error thrown
}

//do statement creates new containing scope, allows errors to be propagated to one or more catch clauses
func makeASandwich() throws {
    //...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}

//assertions
//assert() swift standard library
//assert(condition, messageIfConditionFalse)
let age = -3
assert(age >=-0, "Age cant be less than zero")
//this assertion fails b

//assertionFailure() if condition already checked
if age >= 0 {
    assertionFailure("Age cant be less than zero")
}

//preconditions: condition can be false, but must be true to continue execution
//in subscript
precondition(index > 0, "index must be greater than 0")
//also preconditionFailure()