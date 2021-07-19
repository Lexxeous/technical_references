// Java Coding Reference.java

/*
Sun Microsystems released the Java programming language in 1995. Java is known for being simple, portable, secure, and robust.
Though it was released over twenty years ago, Java remains one of the most popular programming languages today.

One reason people love Java is the Java Virtual Machine, which ensures the same Java code can be run on different operating systems and platforms.
Sun Microsystems’ slogan for Java was “write once, run everywhere”.

Java is very similar to C and C++ syntactically.
*/

// LIBRARIES AND UTILS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

import java.util.Arrays; // default Arrays package ; static size and mutable ; DataType[] arr_name
  // Arrays.toString(<arr>)

import java.util.ArrayList; // default ArrayList package ; dynamic size and mutable ; ArrayList<DataType> arr_lst_name
  .get(<index>) // returns the ArrayList value at <index>
  .set(<index>, <data>) // sets ArrayList value at <index> to <data>
  .add([index], <data>) // adds data to ArrayList
  .remove([index | data]) // remove value at [index] or remove the first occurence of [data] ; indexes get shifted to the left (-1)
    // using a "for" loop, decrement the index value immediately after removing the element
    // using a "while" loop, control the increment of the loop index manually, dont increment upon removal
  .indexOf(<data>) // returns index of first occurence of <data>
  .size() // returns size/length of ArrayList

// KEYWORDS AND DATATYPES –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

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
  .charAt()
  .substring(<idx>) // returns the String object starting at index=<idx>
  .toUpperCase() // returns a String object where all alpha characters are uppercase
  .toLowerCase() // returns a String object where all alpha characters are lowercase


Array
Reference // generic reference to a class object ;  default value is "null"

boolean

char
byte
int
short
long

float
double

void // there is no specific output from a method with this datatype

// Access and Reference Method Modifiers
public // other classes can access method with this modifier
private // other classes can not access method with this modifier ; only methods from within the same class
static // allows a method to be called without explicitly referencing a class instance
final // prepend to a datatype for a value that should never change ; very similar to "const"

// BOOLEANS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

true
false
null

// MATHEMATIC OPERATORS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

+
-
*
/
%

+=
-=
*=
/=
%=

=

// RELATIONAL OPERATORS –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

>
<
>=
<=
==
!=

// LOGICAL OPERATORS ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

&&
||;

// FOR-EACH LOOPS –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

// This is basically the equivalent of Python "for <var> in <collection>" style loops
// Rather than having to index the value of each item in the collection (like in C)
// These are also known as "enhanced loops"
for (String item : items) {  
  System.out.println(item); // print element value
}

// CLASS EXAMPLES –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

public class Printing
{
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


// EOF ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

