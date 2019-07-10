<!-- PHP Coding Reference.php -->
<!-- -->
<?php ;?>

<!-- PHP stands for "Personal Home Page" -->
<!-- PHP keywords are not case sensitive... which is wierd... -->


<p>This HTML will get delivered as is...</p>
<?php echo "<p>... but this is HTML embedded inside of a PHP interpreter.</p>"; // every PHP statement ended with ';'?>


<?php "strings"."getting"."concatenated"; // '.' is the concatentation operator ?>

<?php $variable = "This is how to make PHP variables."; // Variables are not case sensitive ?>

<?php echo "Variables can be included inside of strings like $this_one or like ${this_other_one}."; ?>


<!--––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-->
<!-- PHP OPERATORS: -->

<?php . ; # concatenation operator ?>
<?php .= ; # concatenation assignment operator ?>
<?php =& ; // assign by reference ; changes to the either variable will also effect its partner ?>

<?php +;?>
<?php +=;?>
<?php ++;?>

<?php -;?>
<?php -=;?>
<?php --;?>

<?php *;?>
<?php *=;?>

<?php /;?>
<?php /=;?>

<?php %; // modulo converts values to integers before performing the operation ?>
<?php %=;?>

<?php **;?>


<!--––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-->
<!-- CUSTOM PHP FUNCTIONS: -->

<?php
// any function that does not contain a return value will return "NULL"
// "NULL" also evaluates to 0 when used in math operations
// can set default parameters inside of the function definition parenthesis
// parameters prepended with the '&' character will change the value of the parameter inside and outside of the function
function func_name(integer $param1 = 69, float $param2 = 78.6, ..., string &$paramN = "name")
{
	echo "func_string";
	$result = $param1+$paramN;
	return <func_value>;
};
;?>


<!--––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-->
<!-- CREATING ARRAYS: -->


<?php /*
You cant use "echo" to print arrays because "echo" cant directly convert an array to a single string...
...use "print_r" to print arrays easily instead.
The "print_r" function will print the values of the array by default, use "array_keys()" to return the keys easily instead.
*/ ;?>

<?php 
$arr = array("zero",1,["ar","ray"],"three"); // $arr[2][0] = "ar" ; $arr[2][1] = "ray"
$arr = ["zero",1,["ar","ray"],"three"]; // $arr[0] = "zero"
$arr[] = 4; // $arr[4] = 4 ; appending an element to the end of <$arr>


# Associative arrays can also be made using the same array format from above, but replacing the indexes with keys and associating with "=>"
$ass_arr = array(
	"key1" => "value1",
	"key2" => "value2",
	...
	"keyN" => 72
); // $ass_arr[key2] = "value2"

$ass_arr["keyN+1"] = 73; // appended a new element to the end of the associative array

;?>

<?php /*
Ordered arrays and associative arrays can be mixed together with integers and strings as the keys (hybrid arrays)
When adding a new element to a hybrid array, the integer index will simply be one more than the current largest integer key that exists in the hybrid array.
If no such integer keys exist in the hybrid array, the new element will be indexed with "[0]".
*/ ;?>

<?php
$union_arr = $arr1 + $arr2 + ... + $arrN // will merge <$arr1>, <$arr2>, ... <$arrN> as long as the keys are unique
// if any keys from any arrays are not unique, <$union_arr> will keep the original key-value pair from the former/previous arrays
;?>


<!--––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-->
<!-- BUILT IN PHP FUNCTIONS: -->

<?php
# Built in math functions:
abs($num) // returns the absolute value of <$num>
round($num) // returns <$num> rounded to the nearest whole number
getrandmax() // returns the larget possible random integer for the current PHP environment
rand() // returns a random integer between 0 and <getrandmax()>, INCLUSIVE
rand($lower_bound, $upper_bound) // returns a random integer between <$lower_bound> & <$upper_bound>, INCLUSIVE
ceil() // rounds <$num> up to the nearest whole number 

# Built in datatype functions:
gettype($var) // returns a string version for the datatype of <$var>
var_dump($var) // prints details about <$var>

# Built in string functions:
strrev($str) // returns <$str> with all of the characters in reverse order
strtolower($str) // returns <$str> with all of its characters converted to lowercase
str_repeat($str, $i) // returns a string with <$str> repeated <$i> times
substr_count($haystack, $needle, [$offset], [$length]) // returns how many <$needle> substrings appear in the <$haystack> supersting, progressing through <$length> characters, from starting at index <$offset>
strlen($str) //returns the length of <$str>
str_pad($str, $str_len, [$pad], [$pad_type]) // pads the original <$str> with <$pad> of <$pad_type> to reach a string length of <$str_len> 
implode($glue, $pieces) // returns a string with <$pieces> (typically elements of an array), separated by <$glue>
strpos() // ???
substr() // ???
count_chars() // ???

# Built in array functions:
array($elems) // creates an array with elements <$elems>
count($arr) // returns the number of elements in <$arr>
print_r($arr) // prints <$arr> in a readable fashion with the indexes and values associated
array_pop($arr) // removes and returns the last element of <$arr>
array_push($arr, $elems) // appends <$elems> to the end of <$arr> and returns the new count/lenth of <$arr>
array_shift($arr) // removes and returns the first element of <$arr> ; all other elements are shifted down towards index 0
array_unshift($arr, $elems) // prepends <$elems> to the beginning of <$arr> and returns the new count/length of <$arr>
array_keys($arr, [$value], bool [$strict]) // returns the set of keys that match <$value> based on <$strict> matching (defaults to FALSE) from <$arr>

unset($arr[$key]) // removes a key-value pair from <$arr> specified by <$key>
;?>
