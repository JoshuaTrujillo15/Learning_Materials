// operators

//unary: -a, !b
//binary: 1+1
//ternary: a ? b : c

//assignment
let a = 10
var b = 5
let (x, y) = (2, 2)

//assignment does not return value
if x = y {
    //not valid
}

//arithmetic
1 + 2 //add
1 - 2 //sub
2 * 3 //mult
10.0 / 2.5 //div

//string concat
" hello " + "world" //hello world

9 % 1 //modulo

//unary minus, flip value
let three = 3
let minusThree = -three //-3
let plusThree = -minusThree //3, or - - 3

//unary plus
let minusSix = -6
let alsoMinusSix = +minuxSix //no change

//compound assignment
var a = 1
a += 2 //3

//comparison
/*
equal: (a == b)
not equal: (a != b)
greater: (a > b)
less: (a < b)
ge: (a >= b)
le: ( a <= b )

===, !== to test same object instance
*/

//tuple comparison
//left to right, one at a time, until two values are not equal. those two values compared
(1, "zebra") < (2, "apple") //true, 1 lt 2, zebra and apple not compared
(3, "apple") < (3, "bird") //true, 3 e 3, aplle less than bird
(4, "dog") == (4, "dog") //true, 4 e 4, dog e dog
//does not work with bool

//ternary
//short hand for 
if question {
    answer1
} else {
    answer2
}

//example: row height 50pts taller than content if row has header, else 20
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
//rowHeight = 90

//nil coalescing operator
// ( a ?? b ) unwraps optional a if contains value, or returns default value b if a is nil
//expression a always optional type
//shorthand for 
a != nil ? a! : b

//example: nil-coalescing to choose default color name or optional user defined name
let defaultColorName = "red"
var userDefinedColorName: String? //nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName is nil, use defaultColorName

userDefinedColorName = "green"
var colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName not nil, use "green"

//range operators
for index in 1...5 {
    print("index is \(index)")
}

//half open range operator
//(a..<b) defines range from a to b, excludes b
//half open bc includes a but not b
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

//one sided ranges
for name in names[2...] { // starts at index 2, continues to end
    print(name)
}

for name in names[...2] { // starts at beginnning, ends at index 2
    print(name)
}

for name in names[..<2] { // excludes index 2
    print(name)
}

//cant iterate over one sided range that omits first value, bc isnt clear where iteration shoul begin
//can iterate over one that omits final value, BUT add explicit end
//also can check for explicit value
let range = ...5
range.contains(7) //false
range.contains(4) //true
range.contains(-1) //true

//logical operators
//!a NOT
//a && b AND
//a || b OR

//multiple logicals read left to right
if a && b || c || d {
    print("confirmed")
} else {
    print("denied")
}

//explicit parentheses to make intention easier to read