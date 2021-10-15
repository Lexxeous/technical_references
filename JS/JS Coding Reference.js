// JS Coding Reference

/*--------------------------------------------------------------------------------------------------------------*/
// KEYWORDS & STRUCTURES
	// variables that are defined without given a value will automatically be initialized to "undefined"

var <variable> = <value>; // defines a variable globally or locally to an entire function regardless of block scope ; can change value
let <variable> = <value>; // defines a variable locally ; can change value ; ES6
const <variable> = <value>; // defines a variable locally ; CANNOT change value ; MUST be assigned a value when declared ; ES6
document; // supported by many major modern web browsers ; creates new object for each element on the page for manipulation
window;
Object; // under the hood, arrays and functions are considered objects
String;
Boolean;
Number;
Date;
Math;
Regex();
enum();
function{}; // normal functions in JS do not need to be prototyped ; function expressions need to be declared before they are called
this; // evaluates to the value of the ThisBinding of the current execution context ; access the current element being evaluated
$(this); // creates a jQuery selection; allows jQuery methods to be used on the current element being evaluated
null; // nothing
NaN; // number is too big ; number overflow ; Not a Number
undefined // default when "var" or "let" variable declarations are not initialized
true // boolean true
false // boolean false
throw
try
catch()
finally
debugger // enables debugging interrupt at location for use in the web inspect console
import()
new()
void()
while()
for()
do
with()
typeof() // returns the type of the input variable
switch()
	{case 'One': <expression>; break;
	 case 'Two': <expression>; break;
	 default: 	 <expression>; break;}
delete;
return; // could return a single value as normal or an array of values
break; // break out of a loop
continue; // jump to the next iteration of a loop


/*--------------------------------------------------------------------------------------------------------------*/
// HTML ELEMENT ATTRIBUTES
<elem
	autofocus= // gives focus to this element when the page is loaded
	placeholder= // greyed out hint in a text field about input formatting and such
	required= // checks that the field has a value ; takes a boolean?
	min= // minimum permitted number
	max= // maximum permitted number
	step= // interval by which the numbers should increase or decrease
	value= // default value for a number when the page loads
	autocomplete= // shows a list of past entries ; true by default ; exception for sensitive data
	pattern= // allows a regex specification for validation
	novalidate= // used on the form element to disable the built-in form validation
>


/*--------------------------------------------------------------------------------------------------------------*/
// METHODS

alert("string")
console.log(value) // <value> can be a string, concatenated strings, a number, or an equation with numerical operators
console.group("string")
console.table(object_variable) // take JSON formatted data

array.push() // add item(s) to tail of array and returns the length
array.unshift() // adds item(s) to head of array and returns length
array.pop() // removes item from tail of array and returns the item
array.shift() // removes item from head of array and returns item
array.forEach() // executes a function once for each item in array
array.some() // checks if some/any items in array pass test specified by function
array.every() // checks if all items in array pass test specified by function
array.concat() // creates new array containing its and other array values
array.filter() // creates new array with item(s) that pass test specified by function ; new array is not necessarily same length as original
array.sort() // reorders item(s) in array using a function ; by default the sorting is lexicographically for numbers and strings
array.reverse() // reverses the order of the item(s) in array
array.map() // call a function on each element in array and creates a new (same length) array with results
array.findIndex() // returns the index value of the first element that evaluates true to the callback function ; returns -1 otherwise
array.reduce((total, curr_val, curr_index, arr) => {}, init_val);
	/*
	<total> is <init_val> or the previously returned value of the function ; REQUIRED
	<curr_val> is the value of the current element ; REQUIRED
	<curr_index> is the index of the current element ; OPTIONAL
	<arr> is the array object that the current element belongs to ; OPTIONAL
	<init_val> initializes <total> to some value other than 0 ; OPTIONAL
	*/
array.every() // returns true if every element in <array> passes the callback function test

string.replace(/^the /i, "") // takes a regex as first argument and what to replace with as the second ; replace "the " with ""



/*--------------------------------------------------------------------------------------------------------------*/
// THE MATH AND NUMBER OBJECTS

Math.random() // returns a random value between 0 ~ 1
Math.random() * n // returns a random value between 0 ~ (n - 1)
Math.floor(n) // rounds a numerical down to the nearest Integer
Math.ceil(n) // rounds a numerical value up to the nearest Integer


Number.isInteger(n) // true if 'n' is an Integer and false otherwise




/*--------------------------------------------------------------------------------------------------------------*/
// STRINGS
title = "Mollys Special Offers"; // can use a single single quote inside double quotes
message = '<a href=\"sale.html\">25% OFF!</a>'; // use \ to escape characters inside of a single or double quoted string

"string".length() // returns the total number of characters in the string ; returns 6
"s t r ".trim() // removes the whitespace from a string ; returns "str"
"string".toUpperCase() // converts all characters in the string to upper case ; returns STRING
"string".startsWith("s") // true if string starts with the given character and false otherwise ; returns true

"str" + "ing" = "string"; // can concatenate strings together with the '+' operator

var s = "string"; // s[2] returns 'r'

"Single quotes (') can be used explicitly inside of double quoted strings, they don't have to be escaped (\')."

/*--------------------------------------------------------------------------------------------------------------*/
// ARRAYS
	// apparently you can change elements in an array even if it is declared with a "const"????????

var <arrayName> = ['hello', true, 69]; // array literal
var <arrayName> = new Array('hello', true, 69); // array dynamic constructor
// two ways to declare an array
// elements inside arrays in JS do not all need to be of the same datatype
<arrayName>[<index>] // classic array access
<arrayName>.item(<index>) // can access the items inside an array with the item() function/method
<arr>.push(<elem>) // append <elem> to the end of <arr>
<arr>.pop() // remove last element from <arr>
<arr>.join() // join all elements of <arr> into a single string, including the commas.......
<arr>.slice(<start_i>, <end_i>) // copy <arr> elements from <start_i> to less than <end_i> ; <end_i> is optional
<arr>.splice(<p>, <n>) // remove <n> items from the array, starting from position <p> ; removes elements toward the and of the array
<arr>.shift() // remove element from the front of the array
<arr>.unshift(<elem>) // add <elem> to the front of <arr>
<arr>.concat(<elements> || <arr2>) // elements or another array to <arr> ; can also assign to an independent variable
<arr>.length() // returns the 1-based length of <arr>
<arr>.forEach(function(item, index, array){/* do something for each element in the array */}); // <item>, <index>, & <arr> are usable parameters inside the function
<arr>.indexOf(<elem>) // returns the 0-based index of <elem> if found, returns ???? otherwise



/*--------------------------------------------------------------------------------------------------------------*/
// OPERATORS

1+2 // 3
3-4 // -1
5/6 // .83333333333
7*8 // 56
9%10 // 9
a+=2 // a = a + 2
b-=4 // b = b - 4
c*=6 // c = c * 6
d/=10 // d = d / 10
i++ // increment by 1
j-- // decrement by 1
<var1> = <var2> // assignment
<var1> == <var2> // loose or abstract equality comparison ; similarity ; type conversion
<var1> === <var2> // strict equality comparison ; identity ; no type conversion
<var1> != <var2> // loose or abstract inequality comparison ; type conversion
<var1> !== <var2> // strict inequality comparison ; no type conversion
<var1> > <var2>
<var1> >= <var2>
<var1> < <var2>
<var1> <= <var2>
a&&b // logical AND
c||d // logical OR
	let <var> = <first_val> || <second_val> // if <first_val> is defined, <var> takes its value but takes <second_val> otherwise ; short circuit statement
!<expression>
conditional ? "do it true" : "do if false"; // ternary ; replaces if..else statement/structure(s)


/*--------------------------------------------------------------------------------------------------------------*/
// TEMPLATE LITERALS

// Template literals were introduced in ES6

console.log(`This is a sentence that will be printed literally with a ${placeholder}.`);
console.log(`Single and double quote characters (' & ") will also be printed literally without escacping (\' & \").`);


/*--------------------------------------------------------------------------------------------------------------*/
// FUNCTIONS (Inside objects they are called methods)
	// by default, the return value of any JS function is "undefined"
	// In JS functions are "first class objects", which means that they can have properties and methods just like any other object
	// In JS functions can also accept other functions as parameters and/or have a function as a return value, these are "higher order functions"

function func_name(param1 = "default", param2, ...) // defines a function called <func_name> with a list of parameters and one default parameter
{
	// do something
	return something; // explicit return
};

const func_name = function(param1, param2, ...)
{
  // do something
};

const func_name = (param1, param2, ...) =>
{
  // do something
};

const func_name = param => 3.14159265358*param; // single line function with implicit return


const f = func_name; // assigning a variable to a function allows for shorter reference to the function and associated properties
	f.name() // returns the original function name "func_name"


// FOR EXAMPLE THE RUN TIME OF ANY DESIRED FUNCTION COULD BE ANALYZED BY PASSING THE FUNCTION INTO A "HIGHER ORDER FUNCTION"
const timeFuncRuntime = fParam => {
  let t1 = Date.now();
  fParam();
  let t2 = Date.now();
  return t2 - t1;
};
const func_name_time = timeFuncRuntime(func_name);


func_name(arg1, arg2, ...); // calls func_name



// JS has what is called "Lexical Scope" (or Static Scope)
	// nested functions have access to variables contained within thier parents
	// but parents do not have access to variables contained within thier children

// Immediately Invoked Function Expressions (IIFE) ("iffy")
var area = (function() // 
{
	var width = 3;
	var height = 2;
	return width * height;
}());
// the internal parenthesis tell the interpreter to call the function immediately
// the external parenthesis tell the interpreter to treat as an expression
// the variable area will hold the value of the return statement rather than the function itself


var prices = [1, 2, 125, 2.5, 19, 14, 13.6]
prices.sort(function(a, b){
	return a - b; // sort in ascending order
	return b - a; // sort in descending order
})


/*--------------------------------------------------------------------------------------------------------------*/
// OBJECTS

// JS Objects are similar to Python dictionaries
// The value of an element in a JS Object can also be a function, another Object, or any of the default JS datatypes
// Keys are strings, but dont require the use of surrounding quotation marks if there are no special characters
// Attempting to access data that does not exist within an object will return "undefined"
// Objects are mutable, which means thier keys and values can be updated ; "const" Object values can be updated, but the direct value of the object cannot be reassigned
// Objects are passed by reference, refering to the place in memory which they are stored, rather than the data that the variable stores ; can update Object properties, not fully reassign Object

var hotel = { // creating an object using literal notation
	name: 'Quay',
	rooms: 40,
	booked: 25,
	checkAvailability: function() {
		return this.rooms - this.booked;
	}
};

var object = {} // empty curly brackets will create an empty object using literal notation

// create instances of already created objects using the object constructor notation
var parksHotel = new hotel("Park", 69, 42);
parksHotel.rooms; // can access Object data using dot notation ; 69
parksHotel[booked]; // can also access Object data using bracket notation, it is required to use this notation when keys have special characters ; 42
parksHotel.checkAvailability() // will call the function defined within the Object ; 69-42=27
delete parksHotel.checkAvailability; // removing data from an Object is also possible using the "delete" keyword



/*
	It is also possible to loop through the elements in an Object,
	however, the returned <crewMember> variable does not return the internal Object with `${crewMember}`,
	so to access the <name> property, you must delve through all the Object layers
*/
let spaceship = {
  crew: {
	  captain: { 
      name: 'Lily', 
      degree: 'Computer Engineering', 
      cheerTeam() { console.log('You got this!') } 
    },
	  'chief officer': { 
      name: 'Dan', 
      degree: 'Aerospace Engineering', 
      agree() { console.log('I agree, captain!') } 
    },
	  medic: { 
      name: 'Clementine', 
      degree: 'Physics', 
      announce() { console.log(`Jets on!`) }
    },
	  translator: {
      name: 'Shauna', 
      degree: 'Conservation Science', 
      powerFuel() { console.log('The tank is full!') } 
    }
  }
}; 
for (let crewMember in spaceship.crew) {
  console.log(`${crewMember}: ${spaceship.crew[crewMember].name}`)
};



/*
	Arrow functions inherently bind, or tie, an already defined <this> value to the function itself that is NOT the calling object.
	In the following code snippet below, the value of <this> is the global object, or an object that exists in the global scope,
	which doesn’t have a <prop1> property and therefore returns undefined.
*/
const goat = {
  prop1: "value1",
  arrow_func: () => {console.log(this.prop1);}
};



/*
	There are 3 things to notice about the code snippet below:
	
	1.
		property value shorthand
	2.
		property, functions (require () when called/used), getters and setters (do not require () when called/used)
	3.
		factory functions return objects based on the parameters that are passed in and set to thier property values, quick new obj creation
*/
const robot = {
  model: 'B-4MI',
  mobile: true,
  greetMaster() {console.log(`I'm model ${this.model}, how may I be of service?`);},
  get robotCapacity() {return this._robotCapacity;}
}

const massProdRobot = (model, mobile) => {
  return {
    model,
    mobile,
    greetMaster() {console.log(`I'm model ${this.model}, how may I be of service?`);}
  }
}

const chargingStation = {
  _name: 'Electrons-R-Us',
  _robotCapacity: 120,

  set robotCapacity(newCapacity) {
    if (typeof newCapacity === 'number') {
      this._robotCapacity = newCapacity;
    } else {
      console.log(`Change ${newCapacity} to a number.`)
    }
  },
  get robotCapacity() {
    return this._robotCapacity;
  }
}

const shinyNewRobot = massProdRobot('TrayHax', true); // using the factory function to quickly create a new, custom object instance
shinyNewRobot.mobile = false // ERROR: will not work because the <robot> object does not have a setter method
console.log(shinyNewRobot.mobile); // will return "true"

console.log(chargingStation.robotCapacity); // using a "getter" method to get <robotCapacity()> ; will return 120 ; does not require "()"
chargingStation.robotCapacity = 200;
console.log(chargingStation.robotCapacity); // using a "setter" method to set <robotCapacity()> ; will set to 200 ; does not require "()"



/*
	Destructured Assignment allows you to assign a variable to an Object's property.
	The code snippet below shows how the <functionality> property of the <robot> object is able to be accessed directly after "destructured assignment".
	A similar use of "destructured assignment" is commonly used with "require()" statements at the beginning of a JS script for accessability.
		e.g. "const { shell } = require("shelljs")"
*/
const robot = {
  model: '1E78V2',
  functionality: {
    fireLaser() {console.log('Pew Pew');}
  }
};
const { functionality } = robot;
functionality.fireLaser();



// Object Methods
const <obj_keys_var> = Object.keys(<obj_name>); // will return array of all the available properties for <obj_name>
const <obj_entries_var> = Object.entries(<obj_name>); // will return array of all available properties and thier values for <obj_name>
const <obj_new_assign_var> = Object.assign(<target_obj>, <source_obj>) // will merge <source_obj> with <target_obj> without modifying <source_obj>


/*--------------------------------------------------------------------------------------------------------------*/
// CLASSES:

/*
	JavaScript is an object-oriented programming (OOP) language we can use to model real-world items.
	Classes are a tool that developers use to quickly produce similar objects.
	The code snippet below shows how to interact with class constructors and properties.
	By convention, we capitalize and CamelCase class names.
	Class method and getter syntax is the same as it is for objects EXCEPT YOU CANNOT INCLUDE COMMAS BETWEEN METHODS.
*/

class Dog {
  constructor(name) {
    this._name = name;
    this._behavior = 0;
  }

  get name() {return this._name;}
  get behavior() {return this._behavior;}   
  incrementBehavior() {this._behavior++;}
}

const sparky = new Dog('Sparky'); // new instance of Dog class
console.log(sparky.name); // "Sparky"
console.log(sparky.behavior); // 0
sparky.incrementBehavior();
console.log(sparky.behavior); // 1


/*
	Below is another code snippet example of how to use classes with getter methods and properties.
	For practical implementation of creating lots of instances of a single class,
	an array or a .csv file could be used as proper indexing within a loop.
*/


class Surgeon {
  constructor(name, department) {
    this._name = name;
    this._department = department;
    this._remainingVacationDays = 20;
  }
  get name() {return this._name}
  get department() {return this._department}
  get remainingVacationDays() {
    return this._remainingVacationDays
  }
  
  takeVacationDays(daysOff) {
    this._remainingVacationDays -= daysOff;
  }
}

const surgeonCurry = new Surgeon("Curry", "Cardiovascular");
const surgeonDurant = new Surgeon("Durant", "Orthopedics");

console.log(surgeonCurry.name);
surgeonCurry.takeVacationDays(3);
console.log(surgeonCurry.remainingVacationDays);


/*
	When multiple classes share properties or methods, they become candidates for inheritance,
	a tool developers use to decrease the amount of code they need to write.
	With inheritance, you can create a parent class (also known as a superclass) with properties and methods that multiple child classes
	(also known as subclasses) share. The child classes inherit the properties and methods from their parent class.
	The benefits (time saved, readability, efficiency) of inheritance grow as the number and size of your subclasses increase.
	One benefit is that when you need to change a method or property that multiple classes share, you can change the parent class, instead of each subclass.
	You can also create methods that are available to the entire class, rather than available to only an instance of that class.
	Using the keyword "static", you can create a function that does not require the creation of a "new" class instance.
*/

class HospitalEmployee { // the parent class (superclass)
  constructor(name) {
    this._name = name;
    this._remainingVacationDays = 20;
  }
  
  get name() {return this._name;}
  get remainingVacationDays() {return this._remainingVacationDays;}

  takeVacationDays(daysOff) {this._remainingVacationDays -= daysOff;}
  static generatePassword() {return Math.floor(Math.random() * 10000);}
}

class Nurse extends HospitalEmployee {
  constructor(name, certifications) {
    super(name);
    this._certifications = certifications;
  }
  
  get certifications() {return this._certifications;}
  
  addCertification(newCertification) {this._certifications.push(newCertification);}
}

const nurseOlynyk = new Nurse('Olynyk', ['Trauma','Pediatrics']);
console.log(nurseOlynyk.name); // "Olynyk"
console.log(nurseOlynyk.certifications) // ['Trauma', 'Pediatrics']
console.log(nurseOlynyk.remainingVacationDays); // 20
nurseOlynyk.takeVacationDays(5);
console.log(nurseOlynyk.remainingVacationDays); // 15
nurseOlynyk.addCertification("Genetics");
console.log(nurseOlynyk.certifications); // ['Trauma', 'Pediatrics', 'Genetics']


/*--------------------------------------------------------------------------------------------------------------*/
// MODULES

/*
	JavaScript modules are reusable pieces of code that can be exported from one program and imported for use in another program.
	Modules are particularly useful for a number of reasons. By separating code with similar logic into files called modules, we can:

	1. Find, fix, and debug code more easily
	2. Reuse and recycle defined logic in different parts of our application
	3. Keep information private and protected from other modules
	4. Prevent pollution of the global namespace and potential naming collisions, by cautiously selecting variables and behavior we load into a program
*/


// The ES6 Way:
// ES6 allows for default & named exports and imports, as well as aliased modules, where multiple parent objects or functions can be exported per file
	// "airplane.js"
		let Airplane = {
		  availableAirplanes: [
		    {name: "AeroJet", fuelCapacity: 800},
		    {name: "SkyJet", fuelCapacity: 500 }
		  ]
		};

		let availableAirplanes = [{
			name: 'AeroJet',
			fuelCapacity: 800,
			availableStaff: ['pilots', 'flightAttendants', 'engineers', 'medicalAssistance', 'sensorOperators'],
		}, 
		{
			name: 'SkyJet',
			fuelCapacity: 500,
			availableStaff: ['pilots', 'flightAttendants']
		}];

		let flightRequirements = {requiredStaff: 4};

		export { availableAirplanes as planes, flightRequirements as f_reqs }; // using named export of specific module file objects ; also aliasing
		export default Airplane; // using default export of the main/default module file object

	// "missionControl.js"
		import { planes, f_reqs } from './airplane'; // using named import of specific module file objects ; also aliasing
		import Airplane from './airplane'; // using default import of the main/default module file object

		// This function will reference/use the default import
		function displayFuelCapacity() {
		  Airplane.availableAirplanes.forEach(function(element) {
		    console.log(`Fuel Capacity of ${element.name}: ${element.fuelCapacity}`);
		  });
		}

		// This function will reference/use the named import
		function displayFuelCapacity() {
		  planes.forEach(function(element) {
		    console.log('Fuel Capacity of ' + element['name'] + ': ' + element['fuelCapacity']);
		  });
		}

		displayFuelCapacity();


// The ES5 Way:
// ES5 only allows for default exports and imports where one parent object or function is exported per file
	// "airplane.js"
		let Airplane = {};
		Airplane.myAirplane = "StarJet";
		module.exports = Airplane;

	// "missionControl.js"
		const Airplane = require('./1-airplane.js');

		function displayAirplane() {
		  console.log(Airplane.myAirplane);
		}

		displayAirplane(); // "StarJet"


/*--------------------------------------------------------------------------------------------------------------*/
// PROMISES


/*
In web development, asynchronous programming is notorious for being a challenging topic.

An asynchronous operation is one that allows the computer to “move on” to other tasks while waiting for the asynchronous operation to complete.
Asynchronous programming means that time-consuming operations don’t have to bring everything else in our programs to a halt.

There are countless examples of asynchronicity in our everyday lives.
Cleaning our house, for example, involves asynchronous operations such as a dishwasher washing our dishes or a washing machine washing our clothes.
While we wait on the completion of those operations, we’re free to do other chores.

Similarly, web development makes use of asynchronous operations.
Operations like making a network request or querying a database can be time-consuming,
but JavaScript allows us to execute other tasks while awaiting their completion.

Modern JavaScript handles asynchronicity using the Promise object, introduced with ES6.

Promises are objects that represent the eventual outcome of an asynchronous operation. A Promise object can be in one of three states:

1. Pending:
		The initial state; the operation has not completed yet.
2. Fulfilled:
		The operation has completed successfully and the promise now has a resolved value.
		For example, a request’s promise might resolve with a JSON object as its value.
3. Rejected:
		The operation has failed and the promise has a reason for the failure.
		This reason is usually an Error of some kind.

We refer to a promise as settled if it is no longer pending; it is either fulfilled or rejected.
All promises eventually settle, enabling us to write logic for what to do if the promise fulfills or if it rejects.

The Promise constructor method takes a function parameter called the executor function which runs automatically when the constructor is called.
The executor function generally starts an asynchronous operation and dictates how the promise should be settled.

The executor function has two function parameters, usually referred to as the resolve() and reject() functions.
The resolve() and reject() functions aren’t defined by the programmer.
When the Promise constructor runs, JavaScript will pass its own resolve() and reject() functions into the executor function.

• The resolve parameter is a function with one argument.
	Under the hood, if invoked, resolve() will change the promise’s status from pending to fulfilled,
	and the promise’s resolved value will be set to the argument passed into resolve().
• The reject parameter is a function that takes a reason or error as an argument.
	Under the hood, if invoked, reject() will change the promise’s status from pending to rejected,
	and the promise’s rejection reason will be set to the argument passed into reject().
*/


const inventory = {
  sunglasses: 0,
  pants: 1088,
  bags: 1344
};

const myExecutor = (resolve, reject) => {
  if(inventory.sunglasses > 0) {
    resolve("Sunglasses order processed.");
  }
  else {
    reject("That item is sold out.");
  }
};

function orderSunglasses() {
  return new Promise(myExecutor);
}

orderPromise = orderSunglasses();
console.log(orderPromise);

/* 
	Function setTimeout() is a Node API (a comparable API is provided by web browsers) uses callback functions to schedule tasks to be performed after a delay.
	It has two parameters: a callback function and a delay in milliseconds.

	If we invoke setTimeout() with the callback function func_name() and 2000. In at least two seconds func_name() will be invoked.
	But why is it “at least” two seconds and not exactly two seconds?

	This delay is performed asynchronously; the rest of our program won’t stop executing during the delay.
	Asynchronous JavaScript uses something called the event-loop. After two seconds, func_name() is added to a line of code waiting to be run.
	Before it can run, any synchronous code from the program will run.
	Next, any code in front of it in the line will run. This means it might be more than two seconds before func_name() is actually executed.
*/


const returnPromiseFunction = () => {
  return new Promise((resolve, reject) => {
    setTimeout(( ) => {resolve('I resolved!')}, 1000);
  });
};

const prom = returnPromiseFunction();


/*--------------------------------------------------------------------------------------------------------------*/
// ERRORS

// Objects
Error // generic
SyntaxError // obvious
ReferenceError // scope error
TypeError // unrecognized datatype that cannot be coerced
RangeError // number(s) not within an accepted range
URIError // URI methods used incorrectly
EvalError // eval() used incorrectly

// Properties
name // type of execution
message
fileNumber // name of JS file
lineNumber

try // return, break, and continue keywords will all skip to the finally clause
{
	// try to execute this code
}
catch(exception)
{
	// if an exception is raised, run this code
}
finally
{
	// this always gets executed
}

throw new Error("message");


/*--------------------------------------------------------------------------------------------------------------*/
// STATEMENTS/CONSTRUCTS
	// null, undefined, 0, false, NaN, "", & '' will all evaluate to false for logic conditions

if(condition1)
{

}
else if(condition2)
{

}
else
{

};



switch(condition)
{
	case option1:
		// do something
		break;
	case option2:
		// do something
		break;
	default:
		// do something
		break;
}


for(let i = 0; i < n; i++)
{
	// do something 'n' times
}

