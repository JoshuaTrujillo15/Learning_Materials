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


//----CONSTANTS-----//

//define(name, value, case_insensitive[boolean]);
define('SENTINEL', 15, true);
echo SENTINEL;

define('cars', ['Tesla','Volvo','BMW']);
echo cars[0];

//automatically global
function constantTest() {
    echo SENTINEL;
}


//-----OPERATORS-----//
/*

Logical

and, &&
or, ||
xor
! 

*/


//-----SWITCH-----//

$fav_color = 'purple';
switch($fav_color) {
    case 'red':
        echo 'Your favorite color is red!';
        break;
    case 'purple':
        echo 'Your favorite color is purple!';
        break;
    default:
        echo 'Your favorite color is neither red nor purple!';
}


//-----LOOPS-----//

//while
$while_iter = 1;

while($while_iter <= 5) {
    echo 'The num is: $while_iter<br>';
    $while_iter++;
}

//do
$do_iter = 1;

do {
    echo 'The number is $do_iter';
    $do_iter++;
} while ($do_iter <= 5);

//for
for ($for_iter = 0; $for_iter <= 10; $x++) {
    echo 'The number is $for_iter';
}

//foreach [only array iteration]
$color_arr = array('red','green','blue');

foreach ($color_arr as $value) {
    echo 'The color is $value <br>';
}

//-----ARRAYS-----//

//sort
$num_arr = array(1, 3, 2, 7, 4, 9, 5, 7);
$associative_arr = array('bob'=> 5 ,'alice'=> 5 ,'eve'=> 7); //array(key=>value, key=>value)
sort($num_arr); //ascending order
rsort($num_arr); //descending order
asort($associative_arr); //ascending by value
rsort($associative_arr); //ascending by key
arsort($associative_arr); //descending by value
krsort($associative_arr); //descending by key

//-----SUPER GLOBALS-----//

//$GLOBALS access global variables anywhere
$global_var = 4;
function needsGlobal() {
    echo $GLOBALS['global_var']
}
needsGlobal();

//$_SERVER info about headers, paths, and script locations
echo $_SERVER['PHP_SHELF']; //filename of current script
echo <br>
echo $_SERVER['SERVER_NAME']; //name, ex: webdev1.rennapps.xyz
echo "<br>";
echo $_SERVER['SERVER_ADDR']; //ip address
echo "<br>";
echo $_SERVER['HTTP_HOST']; //host header from current request
echo "<br>";
echo $_SERVER['HTTP_REFERER']; //complete url of current page
echo "<br>";
echo $_SERVER['HTTP_USER_AGENT']; //user agent
echo "<br>";
echo $_SERVER['SCRIPT_NAME']; //pathname of current script

/*
$_REQUEST contains contents of $_GET, $_POST, and $_COOKIE;

$_GET and $_POST create associative array.
    Key = form control
    Value = user input

$_GET passed to script via url params
    Visible to everyone, displayed in url, possible to bookmark page, about 2000char limit
    NON SENSITIVE DATA ONLY

$_POST passed to current script via HTTP POST
    Not visible to everyone, no size limit
    Can use for passwords

*/

//-----REGULAR EXPRESSIONS-----//

//regular expression
$exp = "/john/i"; // delimiter '/', param 'i'

$str = "Hello my name is John";

//preg_match() returns 1 if pattern found, else 0
$pattern = '/john/i';
echo preg_match($pattern, $str); // 1

//preg_match_all() returns num of times pattern found, else 0
$pattern = '/m/i';
echo preg_match_all($pattern, $str); // 2

//preg_replace() replace substring
$pattern = '/john/i';
echo preg_replace($pattern, 'Bob', $str); // Hello, my name is Bob;

/*
Modifiers: 
    i : case insensitive
    m : multiline search
    u: enable correct matching of utf-8 encoded patterns

Patterns:
    [abc] : one character from options between brackets
    [^abc] : any character NOT between brackets
    [0-9] : one character from the range of 0 to 9

Metacharacters:
    | : find match for any one of patterns separated by it example( cat|dog|fish )
    . : find just one instance of any char
    ^ : finds a match as the beginning of string example( ^Hello )
    $ : fins match at end of string example( World$ )
    \d : finds digit
    \s : finds whitespace char
    \b : find match at beginning of a word or at end of word
    \uxxxx : find unicode char specified by hex num

Quantifiers
    n+ : matches any str with at least one n
    n* : matches str with zero or more occurances of n
    n? : matches str with zero or one occurance of n
    n{x} : matches str with x num of n's
    n{x,y} : matches str with x to y num of n's
    n{x,} : matches str with x or more num of n's
*/

//Grouping ( )
$str = "Apples and bananas.";
$pattern = "/ba(na){2}/i"; // ba na na 
echo preg_match($pattern, $str); // 1


//------------------------------SECURITY------------------------------//
//LITERALLY THE MOST IMPORTANT PART OF THIS ENTIRE THING
//htmlspecialchars()
//function to thwart XSS and SQLi attacks. 
//------------------------------SECURITY------------------------------//

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

//-----DATE AND TIME-----//

//date(format, timestamp)
echo date("Y/m/d"); //2020/10/16
echo date("Y-m-d"); //2020-10-16
echo date("l"); //Friday

//automatic copyright year
//&copy; 2010-<?php echo date("Y");\?\>

//time
/*
H : 24hr hour (00 to 23)
h : 12hr hour (01 to 12)
i : minutes w leading zeros (00 to 59)
s : seconds w leading zeros (00 to 59)
a : lowercase am or pm
*/
echo date("h:i:sa"); //12:24:59pm

//RETURNS DATE TIME OF SERVER
//Get time zone
date_default_timezone_set("America/New York");
echo date("h:i:sa");

//mktime(hour, minute, second, month, day, year)
$d = mktime(11, 14, 54, 8, 12, 2014);
echo date("Y-m-d h:i:sa"); //2014-08-12 11:14:54am

//strtotime(time, now)
$d=strtotime("10:30pm April 15 2014");
echo "Created date is " . date("Y-m-d h:i:sa", $d);

//weird strtotime things
//output dates for next sic saturdays
$start_date = strtotime("Saturday");
$end_date = strtotime("+6 weeks", $start_date);

while ($start_date < $end_date) {
    echo date("M d", $start_date) . "<br>";
    $start_date = strtotime("+1 week", $start_date);
}

//dates until July 4
$d1=strtotime("July 04");
$d2=ceil(($d1-time())/60/60/24);
echo "There are " . $d2 ." days until 4th of July.";

//-----FILES-----//

//readfile()
echo readfile("webdictionary.txt");

//fopen() more options than readfile()
$myfile = fopen("webdictionary.txt", "r") or die("Unable to open file!");
echo fread($myfile, filesize("webdictionary.txt")); //fread(file_name, max_bytes_to_read)
fclose($myfile);

//feof() check if end of file has been reached
$myfile = fopen("webdictionary.txt", "r") or die("Unable to open file!");
//Output one line until end of file
while(!feof($myfile)) {
    echo fgets($myfile) . "<br>"; //reads line from pointer location
}
fclose($myfile);
//fgets() for line, fgetc() for char

//fwrite() write to file
$myfile = fopen("newfile.txt", "w") or die("Unable to open file!");
$txt = "John Doe\nJane Doe\n";
fwrite($myfile, $txt);
fclose($myfile);

//-----COOKIES-----//

//setcookie(name, value, expire, path, domain, secure, httponly); only name required

//BEFORE HTML TAG
$cookie_name = "user";
$cookie_value = "john Doe";
setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/"); //86400 = 1day; "/" makes available to whole website

//<html>
//<body>
//<?php
if(!isset($_COOKIE[$cookie_name])) {
    echo "Cookie named '" . $cookie_name . "' is not set!";
} else {
    echo "Cookie named '" . $cookie_name . "' is set!";
    echo "Value is: " . $_COOKIE[$cookie_name];
}
//?\>
//</body>
//</html>

//TO MODIFY COOKIE
//setcookie() again

//TO DELETE COOKIE
//setcookie("user", "", time() - 3600); //sets expiration to past

//CHECK IF COOKIES ENABLED
//setcookie()
//if(count($_COOKIE) > 0) {
    //echo "cookies enabled";
//}



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
