//string literals
let someString = "Some string literal value"

//multiline
let quote = """
im not typing all that

you get the idea
"""

//special unicode
let dollarSign = "\u{24}" //unicode scalar U+0024

//initialize empty
var emptyString = ""
var anotherEmptyString = String()
//equivalent

if emptyString.isEmpty {
    print("nothing here")
}

//string mutability
var variableString = "horse"
variableString += " and carriage"
//good

let constantString = "highlander"
constantString += " and another Highlander"
//compile time error

//working with chars

for character in "dog 🐶" {
    print(character)
}
//d o g 🐶

//create stand alone char
let exclamationMark: Character = "1"
//string value can be constructed by passing character array as arg to initializer
let catCharacters: [Character] = ["C", "a", "t"]
let catString = String(catCharacters)
print(catString) //Cat

//concat strings and chars
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2 //hello there

var instruction = "look over"
instruction += string2 //look over there

welcome.append(exclamationMark) //hello there!

//counting characters
let stringToCount = "this is a string"
print(stringToCount.count) //15

//string index
//startIndex and endIndex valid
let greeting = "Guten Tag!"
greeting[greeting.startIndex] //G
greeting[greeting.index(before: greeting.endIndex)] //!
greeting[greeting.index(after: greeting.startIndex)] //u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] //a

//outside index runtime error
greeting[greeting.endIndex] //error: outside range

//indices property to access each char in string
for index in greeting.indices {
    print("\(greeting[index])", terminator: "") //G u t e n   T a g !
}

//inserting
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex) //hello!
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex)) //hello there!

//removing
welcome.remove(at: welcome.index(before: welcome.endIndex)) //hello there
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range) //hello

//substring, must convert to string for long term use
let greeting = "hello world"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex //either first "," or endIndex
let beginnning = greeting[..<index] //hello
//convert
let newString = String(beginning)
//substring does not take up new memory from string until allocated

//compare strings
//just use == or !=

//hasPrefix
let thing = "this thing"
if thing.hasPrefix("this") {
    //conditional
}
if thing.hasSuffix("thing") {
    //conditional
}