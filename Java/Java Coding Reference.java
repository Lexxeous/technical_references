// Java Coding Reference.java

/*
Sun Microsystems released the Java programming language in 1995. Java is known for being simple, portable, secure, and robust.
Though it was released over twenty years ago, Java remains one of the most popular programming languages today.

One reason people love Java is the Java Virtual Machine, which ensures the same Java code can be run on different operating systems and platforms.
Sun Microsystems’ slogan for Java was “write once, run everywhere”.

Java is very similar to C and C++ syntactically.

Tutorial content credit goes to Codecademy: https://www.codecademy.com/courses/learn-java
*/

// LIBRARIES AND UTILS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

import java.util.Arrays; // default Arrays package ; static size and mutable ; DataType[] arr_name
  .toString(<arr>)
  .deepToString(<multi_dim_arr>)

import java.util.ArrayList; // default ArrayList package ; dynamic size and mutable ; ArrayList<DataType> arr_lst_name
  .get(<index>) // returns the ArrayList value at <index>
  .set(<index>, <data>) // sets ArrayList value at <index> to <data>
  .add([index], <data>) // adds data to ArrayList
  .remove([index | data]) // remove value at [index] or remove the first occurence of [data] ; indexes get shifted to the left (-1)
    // using a "for" loop, decrement the index value immediately after removing the element
    // using a "while" loop, control the increment of the loop index manually, dont increment upon removal
  .indexOf(<data>) // returns index of first occurence of <data>
  .size() // returns size/length of ArrayList

import java.lang.Math;
  int    .abs(int x)
  double .abs(double x)
  double .pow(double base, double exponent)
  double .sqrt(double x)
  double .random() // returns a random value between 0.0 and 1.0
    (Math.random() * (maxValue - minValue)) + minValue // generate a random value in a range
  int    .negateExact(int a)
  double .hypot(double x, double y) // returns sqrt(x^2 + y^2) without intermediate over/under-flow
  double .tanh(x) // returns hyperbolic tangent of x


// KEYWORDS AND DATATYPES –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

System
  .out // standard out
  .err // standard error
  .in // standard in

// Strings are immutable objects and cannot be "changed" unless a new variable or object is created.
String
  // the '+' operator works for variable types that are not explicit strings
	.equals(<str>) // returns a boolean of whether two strings are equal or not ; case sensitive
  .equalsIgnoreCase(<str>) // returns a boolean whether two strings are equal or not ; not case sensitive
  .compareTo() // lexicographically (alphabetic order) compares String(s) converted to unicode
    // returns 0 if the String objects are the same
    // returns < 0 if the String object is lexicographically less than the String object passed as a parameter
    // returns > 0 if the String object is lexicographically more than the String object passed as a parameter
      // Watch for case: M -> P -> -3 ; m -> P -> +29
  .length() // returns the length of the String object
  .concat(<str2>) // concatenates 2 String objects together, usage: <str1>.concat(<str2>)
  .indexOf(<sub_str>) // returns the first occuring index of <sub_str> ; if not found, returns -1
  .charAt(<idx>) // returns the character at index=<idx> from the String object
  .substring(<start_idx> [, <end_idx>]) // returns a portion of String object ; starting index in inclusive, end is not
  .toUpperCase() // returns a String object where all alpha characters are uppercase
  .toLowerCase() // returns a String object where all alpha characters are lowercase
  .valueOf(String <str>) // converts string into a number


Array

Reference // generic reference to a class object ;  default value is "null"

Integer // https://docs.oracle.com/javase/8/docs/api/java/lang/Integer.html
  .MIN_VALUE // constant holding the minimum value an int can have, -2^31
  .MAX_VALUE // constant holding the maximum value an int can have, 2^31-1
  .SIZE // number of bits used to represent an int value in two's complement binary form
  .BYTES // number of bytes used to represent a int value in two's complement binary form

boolean

char
byte

int
short
long

float
double

void // there is no return value from a method with this datatype

// Access and Reference Method Modifiers
public // all other classes can access class methods/variables with this modifier
protected // only inherited classes can access both public and private methods/variables with this modifier
private // other classes can NOT access methods/variables with this modifier ; only methods from within the same class
static // allows a method to be called without explicitly referencing a class instance
final // prepend to a datatype for a value that should never change ; very similar to "const"

// EXCEPTIONS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

Exception
  RuntimeException
  SecurityException
  ArithmeticException
  ClassCastException

// try-catch blocks allow us to catch general or specific exceptions and handle them how we see fit
try {
  //  Block of code to try
} catch (Exception e) {
  System.err.println("Print error message");
} catch (ArithmeticException e) {
  //  Code to handle an ArithmeticException
}

// BOOLEANS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

true // yes

false // no

null // nothing

// MATHEMATIC OPERATORS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

+ // add (and string concatenation)
- // subtract
* // multiply
/ // divide
% // modulus

<v> += <a> // <v> = <v> + <a> ; increment <v> by <a>
<w> -= <b> // <w> = <w> - <b> ; decrement <w> by <b>
<x> *= <c> // <x> = <x> * <c>
<y> /= <d> // <y> = <y> / <d>
<z> %= <e> // <z> = <z> % <e>

++ // increment by 1
-- // decrement by 1

= // variable assignment

// RELATIONAL OPERATORS –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

> // is greater than
< // is less than
>= // is greater than or equal to
<= // is less than or equal to

== // is equal to
!= // is not equal to

// LOGICAL OPERATORS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

== // is equal to
!= // is not equal to

& // AND
| // OR
^ // XOR
! // NOT

&& // short-circuit AND
|| // short-circuit OR

// CONDITIONAL OPERATORS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

<bool_expr> ? <true_expr> : <false_expr>; // ternary ; single line "if" statement

// THE "THIS" KEYWORD –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

// If there are 2 variables inside of a class that are named the same, the this.<var> will always refer to the instance variable of that class
// When not using the "this" keyword when there are duplicate <var>s, methods will use the local or param value, by default
this.<var>;

// We can also use the "this" keyword on methods when we want to reference the current object without creating a "new" one
// We can also use the "this" keyword as parameters to pass/act on the current object instance inside of another method
public class Computer {
  private int brightness;
  private int volume;
 
  public void setBrightness(int inputBrightness) {
    this.brightness = inputBrightness;
  }
 
  public void setVolume(int inputVolume) {
    this.volume = inputvolume;
  }
 
  public void resetSettings() {
    this.setBrightness(0);
    this.setVolume(0);
  }

  public void pairWithOtherComputer(Computer comp) {
  // Code for method that uses a Computer object
  }
 
  public void setUpConnection() {
    // We use "this" to call the method and also pass "this" to the method so it can be used in "that" method
    this.pairWithOtherComputer(this);
  }
}

// STATIC VS. NON-STATIC ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

// Static methods do not require you to create a new instance of an object before you call them
// Static methods are methods that belong to an entire class, not a specific object of the class
// Static methods can’t interact with non-static instance variables
  // The this keyword can’t be used by a static method since static methods are associated with an entire class, not a specific object of that class
import java.lang.Math; // simple import of the Math library where the methods are static
  Math.<math_method>(<params>); // prefix the library name to call methods
import static java.lang.Math.*; // import all the Math library methods statically
  <math_method>(<params>); // can call the Math library methods directly without having to use the "Math." prefix

// Non-static methods DO require you to make a new instance of a class object before calling them

// Static variables belong to the class itself rather than belonging to an object instance of a class
public class Dog {
 
  // Static variables
  public static String genus = "Canis"; // all dogs have the same genus, no need to change ; not the same as final / const
 
  //Instance variables
  public int age;
  public String name;
 
  public Dog(int inputAge, String inputName) {
    this.age = inputAge;
    this.name = inputName;
  }
}

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// We can keep track of and change the value of static class variables with constructors and "destructors"

public class ATM {
  // Static variables
  public static int totalMoney = 0;
  public static int numATMs = 0;

  // Instance variables
  public int money;

  // use constructor to keep track of how much total money and how many ATMs are available
  public ATM(int inputMoney) {
    this.money = inputMoney;
    numATMs += 1;
    totalMoney += inputMoney;
  }
}

// FOR-EACH LOOPS –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

// This is basically the equivalent of Python "for <var> in <collection>" style loops
// Rather than having to index the value of each item in the collection (like in C)
// These are also known as "enhanced loops"
for (String item : items) {  
  System.out.println(item); // print element value
}

// INHERITANCE ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

// Parent class, superclass, and base class refer to the class that another class inherits
// Child class, subclass, and derived class refer to a class that inherits from another class

public class Noodle {
  
  protected double lengthInCentimeters;
  protected double widthInCentimeters;
  protected String shape;
  protected String ingredients;
  protected String texture = "brittle"; // "all noodles start out hard/brittle"
  
  Noodle(double lenInCent, double wthInCent, String shp, String ingr) {
    this.lengthInCentimeters = lenInCent;
    this.widthInCentimeters = wthInCent;
    this.shape = shp;
    this.ingredients = ingr;
  }

  public void cook() {
    this.texture = "soft"; // "all noodles are soft after cooking"
  }
  
  final public boolean isTasty() { // cannot change this method because "all noodles are tasty"
    return true;
  }
  
  public static void main(String[] args) {
    Ramen ramen = new Ramen();
    Pho pho = new Pho();

    System.out.println(ramen.isTasty()); // true
    System.out.println(pho.isTasty()); // true
    
    System.out.println(ramen.texture); // "brittle"
    ramen.cook();
    System.out.println(ramen.texture); // "squishy"

    Noodle noodleList = {ramen, pho}; // list of different Noodle objects
    for(noodle : noodleList) {
      System.out.println(noodle.lengthInCentimeters); // 30.0, 20.0
    }
  }
}

public class Ramen extends Noodle {
  
  Ramen() {
    super(30.0, 0.3, "flat", "wheat flour"); // super method uses the parents constructor
  }

  @Override public void cook() { // override the parents method functionality
    this.texture = "squishy";
    // can use super.cook() to invoke the parents version of the method
  }
}

public class Pho extends Noodle {
  Pho() {
    super(20.0, 0.5, "flat", "rice flour");
  }
}

/*
Java incorporates the object-oriented programming principle of polymorphism.
Polymorphism, which derives from Greek meaning “many forms”, allows a child class to
share the information and behavior of its parent class while also incorporating its own functionality.
*/

// CLASS EXAMPLES –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

public class Printing {
  public static void main(String[] args)
  {
    System.out.println("Hello World!");
    call_func();
  }

  public static void call_func()
  {
    System.out.println("Printing another line.");
  }
}

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

public class Store
{
  // instance fields are usable by all methods in a particular class
  String productType;
  int inventoryCount;
  double inventoryPrice;
  
  /* Constructor method */
  public Store(String product, int count, double price)
  {
    productType = product;
    inventoryCount = count;
    inventoryPrice = price;
  }

  // advertise method
  public void advertise()
  {
    String message = "Selling " + productType + "!";
    System.out.println(message);
  }
  
  public void greetCustomer(String customer)
  {
    System.out.println("Welcome to the store, " + customer + "!");
  }

  public String info()
  {
    return "This store sells " + productType + " at a price of " + price + ". There are " + inventoryCount + " items left.";
  }
  
  /* Main method */
  public static void main(String[] args)
  {
    Store lemonadeStand = new Store("lemonade", 42, .99);
    Store cookieShop = new Store("cookies", 12, 3.75);
    
    System.out.println("Our first shop sells " + lemonadeStand.productType + " at " + lemonadeStand.inventoryPrice + " per unit.");
    System.out.println("Our second shop has " + cookieShop.inventoryCount + " units remaining.");
    System.out.println(lemonadeStand); // will print "Store@<instance_memory_addr>"
    System.out.println(cookieShop); // will print "Store@<instance_memory_addr>"
  }
} // Store class

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

public class SavingsAccount
{
  int balance;
  
  public SavingsAccount(int initialBalance)
  {
    balance = initialBalance;
  }
  
  public void checkBalance()
  {
    System.out.println("Hello!");
    System.out.println("Your balance is " + balance);
  }
  
  public void deposit(int amountToDeposit)
  {
    balance = balance + amountToDeposit;
    System.out.println("You just deposited " + amountToDeposit);
  }
  
  public int withdraw(int amountToWithdraw)
  {
    balance -= amountToWithdraw;
    System.out.println("You just withdrew " + amountToWithdraw);
    return amountToWithdraw;
  }
  
  public static void main(String[] args)
  {
    SavingsAccount savings = new SavingsAccount(2000);
    savings.checkBalance(); //Check balance:
    int less = savings.withdraw(300); //Withdrawing:
    savings.checkBalance(); //Check balance:
    savings.deposit(600); //Deposit:
    savings.checkBalance(); //Check balance:
    savings.deposit(600); //Deposit:
    savings.checkBalance(); //Check balance:
  }       
} // Savings class

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

public class Dog {
  String breed;
  boolean hasOwner;
  int age;
  
  public Dog(String dogBreed, boolean dogOwned, int dogYears) {
    System.out.println("Constructor invoked!");
    breed = dogBreed;
    hasOwner = dogOwned;
    age = dogYears;
  }
  
  public static void main(String[] args) {
    System.out.println("Main method started");
    Dog fido = new Dog("poodle", false, 4);
    Dog nunzio = new Dog("shiba inu", true, 12);
    boolean isFidoOlder = fido.age > nunzio.age;
    int totalDogYears = nunzio.age + fido.age;
    System.out.println("Two dogs created: a " + fido.breed + " and a " + nunzio.breed);
    System.out.println("The statement that fido is an older dog is: " + isFidoOlder);
    System.out.println("The total age of the dogs is: " + totalDogYears);
    System.out.println("Main method finished");
  }
} // Dog class

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

public class Newsfeed {
  
  String[] trendingArticles;
  int[] views;
  double[] ratings;
  
  public Newsfeed(String[] initialArticles, int[] initialViews, double[] initialRatings){
    trendingArticles = initialArticles;
    views = initialViews;
    ratings = initialRatings;
  }
  
  public String getTopArticle(){
    return trendingArticles[0];
  }
  
  public void viewArticle(int articleNumber){
    views[articleNumber] = views[articleNumber] + 1;
    System.out.println("The article '" + trendingArticles[articleNumber] + "' has now been viewed " + views[articleNumber] + " times!");
  }
  
  public void changeRating(int articleNumber, double newRating){
    if (newRating > 5 || newRating < 0) {
      System.out.println("The rating must be between 0 and 5 stars!");
    } else {
      ratings[articleNumber] = newRating;
      System.out.println("The article '" + trendingArticles[articleNumber] + "' is now rated " + ratings[articleNumber] + " stars!");
    }
  }
  
  public static void main(String[] args){
    String[] robotArticles = {"Oil News", "Innovative Motors", "Humans: Exterminate Or Not?", "Organic Eye Implants", "Path Finding in an Unknown World"};
    int[] robotViewers = {87, 32, 13, 11, 7};
    double[] robotRatings = {2.5, 3.2, 5.0, 1.7, 4.3};
    Newsfeed robotTimes = new Newsfeed(robotArticles, robotViewers, robotRatings);
    
    robotTimes.viewArticle(2);
    robotTimes.viewArticle(2);
    System.out.println("The top article is " + robotTimes.getTopArticle());
    robotTimes.changeRating(3, 5);
  }
} // Newsfeed class

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

import java.util.Arrays;

public class Newsfeed {
  
  String[] topics;
  
  public Newsfeed(String[] initialTopics) {
    topics = initialTopics;
  }
  
  public static void main(String[] args) {
    Newsfeed feed;
    if (args[0].equals("Human")) {
      
      //topics for a Human feed:
      String[] humanTopics = {"Politics", "Science", "Sports", "Love"};
      feed = new Newsfeed(humanTopics);
      
    } else if(args[0].equals("Robot")) {
      
      //topics for a Robot feed:
      String[] robotTopics = {"Oil", "Parts", "Algorithms", "Love"};
      feed = new Newsfeed(robotTopics);
      
    } else {
      String[] genericTopics = {"Opinion", "Tech", "Science", "Health"};
      feed = new Newsfeed(genericTopics);
    }
        
    System.out.println("The topics in this feed are:");
    System.out.println(Arrays.toString(feed.topics));
  }
} // Newsfeed class with command line argument(s)

// MATRIX TRAVERSAL –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

// ROW-MAJOR ORDER –––––––––––––––––––––––––––––––––––––––––––––

for(int r = 0; r < matrix.length; r++) {
  for(int c = 0; c < matrix[0].length; c++) {
    System.out.print("Element: " + matrix[r][c]);
    System.out.println();
  }
}

// COLUMN-MAJOR ORDER ––––––––––––––––––––––––––––––––––––––––––

for(int c = 0; c < matrix[0].length; c++) {
  for(int r = 0; r < matrix.length; r++) {
    System.out.print("Element: " + matrix[r][c]);
    System.out.println();
  }
}

// EOF ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

