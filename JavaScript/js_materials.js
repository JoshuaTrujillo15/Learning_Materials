"use strict"; //top of code!!

//change content in html element id="demo"
//JS accepts single and double quotes
document.getElementById("demo").innerHTML = "Hello Javascript";

//change img source on click
document.getElementById('myImg').src='different.jgp';

//change style of html element
document.getElementById('demo').style.fontSize = '35px';

//hide html elements
document.getElementById('demo').style.display = 'none';

//show html elements
document.getElementById('demo').style.display = 'block';

//<script> tag
/* HTML5
<script>
    document.getElementById('demo').innerHTML = 'My First JavaScript';
</script>
*/

//js_learning.html for more!

let message; //declares variable
message = 'Hello'; //assigns value to variable
alert(message); //show variable content

let user = 'John',
    age = 25;

//"-" NOT allowed in variable name
//variableName, variable_name

const MY_BIRTHDAY = "00-00-0000"; //declare constant, unchangable
//constants all caps good practice

let number = 12345 //"number"data type
let bigInt = 12345123451234512345123145n //big number ends with "n", must be > 2^53 - 1
let str = "hello" //string
let boolean = true; //boolean
let nan = null; //special value, null
let age; //special, undefined
age = 10;
age = undefined; //assigns 

let x;
typeof x;
typeof(x); //returns type of arg

alert('hello'); //pop up alert
let result = prompt(title);

let internet_explorer_prompt =  prompt('word', ''); //for I.E. always use optional default parameter

let confirmation = confirm('question');
alert( confirmation ); //true if OK is pressed

//string conversion
let value = true;
alert(typeof value); //boolean
value = String(value)
alert(typeof value); //string

//numeric conversion
str = '123';
alert(typeof str); //string
let num = Number(str);
alert(typeof num); //num

age = Number('an arbtrary string instead of num');
alert(typeof age); //returns NaN, conversion error

alert(Number('  123  ')); //123
alert(Number('123z')); //NaN (z failed conversion)
alert(Number(true)); //1
alert(Number(false)); //0

//boolean conversion
alert(Boolean(1)); //true
alert(Boolean(0)); //false
alert(Boolean('hello')); //non empty string ALWAYS returns true (even '0')
alert(Boolean('')); //empty string, NaN, null, and undefined return false

//basic operators, mathS
x = 1;
x = -x;
alert(x); //-1 unary negation applied

/*

+ addition
- subtraction
* multiplication
/ division
% modulo
** exponentiation

*/

//string concatenation with binary +
let s = 'my ' + 'string';
alert(s);

alert( '1' + 2 ); //'12' string
alert( 1 + '2' ); //'21' string
alert(2 + 2 + '1'); //returns '41' NOT '221'

//ONLY + converts to string when one operand is string
//other operators convert to number if possible

//+ unary NO effect on nums, converts other values to num
//+ unary SAME as Number()
let y = -2;
alert(+y); //-2

//chain assignment

let a, b, c
a = b = c = 2 + 2; //all values assigned 4

a += 2; //<--this works in JS :)

a++; //<--this also works :)

/*
BITWISE
& AND
| OR
^ XOR
~ NOT
<< LEFT SHIFT
>> RIGHT SHIFT
>>> ZERO-FILL RIGHT SHIFT
*/
