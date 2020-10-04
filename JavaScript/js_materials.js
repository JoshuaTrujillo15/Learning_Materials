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
