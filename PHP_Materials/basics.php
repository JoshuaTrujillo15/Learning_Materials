<?php
// comment out
# also comment out
/*
    multiline
    comment
*/

//line end with ';'
$text = 'PHP';
//[ echo, if, else, while ] all NOT case sensitive
echo '$text is weird!';

/*
Variable Rules:

Start with $, followed by name
Name start with letter or underscore
Name CANNOT start with num
Name must only contain alphanumeric and underscores
Names case sensitive
*/

$text = 'word';
//both return same output
echo 'this is a $text!';
echo 'this is a ' . $text . '!';

$x = 5;
$y = 4;
echo $x + $y;
//9

/*
Loose Language
no data type declaration
str + num = no error

php7 includes data type declaration in strict
throws 'Fatal Error' on type mismatch

*/

//assign by reference
//ONLY named variables can be assigned by reference
$foo = 'Bob';
$bar = &$foo; //reference $foo via $bar
$bar = 'My name is $bar';
echo $bar; //returns My name is Bob
echo $foo; //returns My name is Bob

//echo vs print
//echo marginally faster, does not set a return value
echo 'hello';
//sets return value 1
print 'hello';
$ret = print 'hello';
print $ret; 
//1


//-----DATA TYPES-----//


//var_dump() returns data value and type

//string
$str = 'hello';
var_dump($str);

//integer
$int = 5;
var_dump($int);

//float
$flt = 1.25;
var_dump($flt);

//boolean
$bool = true;
var_dump($bool);

//array
$arr = array('hello', 'i', 'am', 'an', 'array');
var_dump($arr);

//NULL
$null = null; //also null if created without value
var_dump($null); 

//Object
class Car {
    public $color;
    public $model;
    public function __construct($color, $model) {
        $this->color = $color;
        $this->model = $model;
    }
    public function message() {
        return 'This car is a ' . $this->color . ' ' . $this->model . '.';
    }
}

$myCar = new Car('black', 'Volvo');
echo $myCar -> message();
echo '<br>';
$myCar = new Car('red', 'Tesla');
echo $myCar -> message();


//-----STRING FUNCTIONS-----//

$cliche = 'Hello World!'

echo strlen($cliche); // 12
echo str_word_count($cliche); // 2
echo strrev($cliche); // !dlrow olleH
echo strpos($cliche, 'world') // 6 [returns index at start of substring match]
echo str_replace('world', 'friend', $cliche); // Hello friend!


//-----NUMBERS-----//

//Automatic num type conversion
//INT size limit (2^31)-1, if exceeded, assigned as float
$int = 29;
$hex_int = 0xf3;
$oct_int = 17;
var_dump(is_int($int));
var_dump(is_integer($hex_int)); //alias for is_int
var_dump(is_long($oct_int)); //alias for is_int
//all return true

//NOTE
$x = 2;
$y = 5.5;
$z = $x * $y; //z is float without decimal

//FLOATS
$flt = 10.75;
$big_flt = 7.64E+5;
var_dump(is_float($flt)); 
var_dump(is_double($big_flt)); //alias for is_float

//INFINITY
$infinity = 1.9e411;
var_dump(is_infinite($infinity)); //infinite check
var_dump(is_finite($infinity)); //finite check

//NaN (Not a Number) for impossible mathematical operations
$nan = acos(8);
var_dump(is_nan($nan));

//Numeric String
$x = 5985;
var_dump(is_numeric($x)); //true

$x = "5985";
var_dump(is_numeric($x)); //true

$x = "59.85" + 100;
var_dump(is_numeric($x)); //true

$x = "Hello";
var_dump(is_numeric($x)); //false

//Casting Strings and Floats to Integers
$flt = 2345.678;
$int_cast = (int)$flt;
echo $int_cast; // 2345

//-----MATHS-----//

//Pi
echo(pi()); // 3.1415926535898

//min max
$arr = (0, 150, 30, 20, -8, -200)
echo(min($arr)); // -200
echo(max($arr)); // 150

//absolute value
echo(abs(-6.7)); // 6.7

//square root
echo(sqrt(64)); // 8 

//round
echo(round(0.60)); // 1 [nearest int]

//random
echo(rand());
echo(rand(10, 100)); // between 10 an 100 inclusive


//-----SCOPE-----//

//Global
$a = 5; //global scope

function myTest() {
    echo '$a';  //using $a here will gen error
}
myTest();
echo '$a';

//Local Scope
function myTestTwoElectricBoogaloo() {
    $y = 6; //local scope
    echo '$b';
}
myTestTwoElectricBoogaloo();
echo '$b'; //usiing $b here will gen error

//Global Keyword
$c = 5;
$d = 6;
function myTestThree() {
    global $c, $d; //allows function to access global variable
    $d = $c + $d; 
}
myTestThree();
echo $d; //returns 11

//Global Index
//global variables stored in array $GLOBALS[index]
$e = 5;
$f = 10;
function myTestFiveBecauseFourIsBoring() {
    $GLOBALS['f'] = $GLOBALS['e'] + $GLOBALS['f'];
}
myTestFiveBecauseFourIsBoring();
echo $f; //returns 15

//Static Variables
function myTestFourBecauseFourReallyIsNotThatBadOfANumber() {
    static $x = 0;
    echo $x;
    $x++; //well i suppose ++ works :)
}
myTestFourBecauseFourReallyIsNotThatBadOfANumber();
myTestFourBecauseFourReallyIsNotThatBadOfANumber();
myTestFourBecauseFourReallyIsNotThatBadOfANumber();
myTestFourBecauseFourReallyIsNotThatBadOfANumber();
//variable stores value even after function executed


?>

<!DOCTYPE html>
<html lang="en">
<body>
    <h1>PHP page</h1>
    <?php
        //php embeded in html page
        echo "this is the php page";
    ?>
</body>
</html>
