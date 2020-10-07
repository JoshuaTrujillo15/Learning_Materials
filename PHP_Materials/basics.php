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